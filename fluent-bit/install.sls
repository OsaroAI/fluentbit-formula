# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fluent-bit/map.jinja" import bit with context %}

{% set os_distrubition = grains['lsb_distrib_codename'] %}


fluent_pkgrepo:
  pkgrepo.managed:
    - humanname: {{ os_distrubition }}
    - name: deb https://packages.fluentbit.io/ubuntu/{{ os_distrubition }} {{ os_distrubition }} main
    - key_url: https://packages.fluentbit.io/fluentbit.key
    - clean_file: True
    - file: /etc/apt/sources.list.d/fluent.list

{{ bit.pkg }}-pkg:
  pkg.installed:
    - name: {{ bit.pkg }}
    - version: {{ bit.version }}
    - require:
      - fluent_pkgrepo
