{% set os_distrubition = grains['lsb_distrib_codename'] %}

# Manually add the fluent-bit key as Salt does not update it
add_fluent_bit_key:
  cmd.run:
    - name: "wget -qO - https://packages.fluentbit.io/fluentbit.key | apt-key add -"

fluent_pkgrepo:
  pkgrepo.managed:
    - humanname: {{ os_distrubition }}
    - name: deb https://packages.fluentbit.io/ubuntu/{{ os_distrubition }} {{ os_distrubition }} main
    - key_url: https://packages.fluentbit.io/fluentbit.key
    - clean_file: True
    - file: /etc/apt/sources.list.d/fluent.list

