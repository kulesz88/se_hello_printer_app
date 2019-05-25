from selenium import webdriver
import unittest
import time
import pytest

@pytest.mark.uitest
class TestFormatter(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        time.sleep(5)
        driver.quit()
