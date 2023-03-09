
{% from "fluent-bit/map.jinja" import bit with context %}

include:
{%- if grains.get('lsb_distrib_release') == "16.04" %}
    - .ubuntu_16
{%- else %}
    - .ubuntu_22
{%- endif %}

{{ bit.pkg }}-pkg:
  pkg.installed:
    - name: {{ bit.pkg }}
    - version: {{ bit.version }}
    - require:
      - fluent_pkgrepo
