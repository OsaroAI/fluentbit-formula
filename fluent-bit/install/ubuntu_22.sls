{% set os_distrubition = grains['lsb_distrib_codename'] %}

fluent_pkgrepo:
  pkgrepo.managed:
    - humanname: {{ os_distrubition }}
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/fluentbit-keyring.gpg] https://packages.fluentbit.io/ubuntu/{{ os_distrubition }} {{ os_distrubition }} main
    - key_url: https://packages.fluentbit.io/fluentbit.key
    - clean_file: True
    - file: /etc/apt/sources.list.d/fluent.list
    - aptkey: False
