from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import subprocess
import unittest
import os

TEST_URL = os.getenv('TEST_URL')
if not TEST_URL:
    TEST_URL = subprocess.check_output(
        "cd hypernode-vagrant; vagrant ssh-config "
        "| grep HostName | awk '{print $NF}'",
        shell=True
    ).strip()


class TestHyperform(unittest.TestCase):
    browser = webdriver.PhantomJS()

    def setUp(self):
        self.addCleanup(self.browser.quit)

    def test_title_is_hypernode_docs(self):
        self.browser.get("http://" + TEST_URL)
        self.assertIn('Hypernode Docs', self.browser.title)

if __name__ == '__main__':
    unittest.main(verbosity=2)
