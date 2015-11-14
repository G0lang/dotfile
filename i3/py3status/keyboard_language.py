# -*- coding: utf-8 -*-
"""
Display the current keyboard language.
"""

from subprocess import check_output
from time import time
import shlex
import re

# colors of layouts, check your command's output to match keys
LANG = {
    '00000000': 'en',
    '00000001': 'en',
    '00000002': 'en',
    '00000003': 'en',
    '00001004': 'fa',
    '00001005': 'fa',
    '00001006': 'fa',
    '00001007': 'fa',
}

LANG_COLORS = {
    'en': '#729FCF',  # light blue
    'fa': '#FCE94F',  # yellow
}

LANG_RE = re.compile(r".*LED mask:\s*(\w+).*", flags=re.DOTALL)


class Py3status:
    # available configuration parameters
    cache_timeout = 5

    def _xset(self):
        out = check_output(shlex.split("xset -q")).decode("utf-8")

        code = re.match(LANG_RE, out).group(1)

        return LANG.get(code)

    def keyboard_language(self, i3s_output_list, i3s_config):
        response = {
            'cached_until': time() + self.cache_timeout,
            'full_text': ''
        }

        lang = self._xset().strip()

        response['full_text'] = lang or '??'
        response['color'] = LANG_COLORS.get(lang)

        return response

if __name__ == "__main__":
    """
    Test this module by calling it directly.
    """
    from time import sleep
    x = Py3status()
    config = {
        'color_good': '#00FF00',
        'color_bad': '#FF0000',
    }
    while True:
        print(x.keyboard_language([], config))
        sleep(1)
