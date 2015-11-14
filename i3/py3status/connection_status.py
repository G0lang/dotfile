# -*- coding: utf-8 -*-
"""
Display if a connection to the internet is established.
"""

from subprocess import check_output
from time import time
import shlex
import re
try:
    # python3
    from urllib.request import urlopen
except:
    from urllib2 import urlopen


class Py3status:
    # available configuration parameters
    cache_timeout = 10
    format_offline = '■'
    format_online = '●'
    format_online_vpn = '▼'
    # format_online_vpn = '◉'
    timeout = 2
    url = 'http://www.google.com'

    def _check_vpn(self):
        out = check_output(shlex.split("/sbin/ifconfig")).decode("utf-8")
        kvre = re.compile(r"^kvnet.*", flags=re.DOTALL)
        return re.match(kvre, out)

    def _connection_present(self):
        try:
            urlopen(self.url, timeout=self.timeout)
        except:
            return False
        else:
            return True

    def connection_status(self, i3s_output_list, i3s_config):
        response = {
            'cached_until': time() + self.cache_timeout
        }

        connected = self._connection_present()
        if connected:
            response['full_text'] = self.format_online
            response['color'] = i3s_config['color_good']
            if self._check_vpn():
                response['full_text'] = self.format_online_vpn
                response['color'] = i3s_config['color_degraded']
        else:
            response['full_text'] = self.format_offline
            response['color'] = i3s_config['color_bad']

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
        print(x.connection_status([], config))
        sleep(1)
