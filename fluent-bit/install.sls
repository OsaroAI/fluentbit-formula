# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fluent-bit/map.jinja" import bit with context %}

fluent_pkgrepo:
  pkgrepo.managed:
    - humanname: fluent-bionic 
    # TODO (akhattar): add conditional for checking ubuntu version
    - name: deb https://packages.fluentbit.io/ubuntu/xenial xenial main
    - key_url: https://packages.fluentbit.io/fluentbit.key
    - clean_file: True
    - file: /etc/apt/sources.list.d/fluent.list

{{ bit.pkg }}-pkg:
  pkg.installed:
    - name: {{ bit.pkg }}
    - require:
      - fluent_pkgrepo
