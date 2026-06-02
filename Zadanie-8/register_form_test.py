import pytest
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC

@pytest.fixture
def driver():
    options = webdriver.ChromeOptions()
    driver = webdriver.Chrome(options=options)
    driver.maximize_window()
    
    yield driver
    
    driver.quit()

def test_no_password(driver):
    # arrange
    driver.get("http://localhost:5173")
    wait = WebDriverWait(driver, 10)

    xpath_register_button = '//*[@id="root"]/div/main/div/div/div[1]/button'
    register_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_register_button)))
    register_button.click()

    xpath_email_window = '//*[@id="root"]/div/main/div/div/form/input[1]'
    email_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_email_window)))

    xpath_password_window = '//*[@id="root"]/div/main/div/div/form/input[2]'
    password_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_password_window)))

    xpath_submit_button = '//*[@id="root"]/div/main/div/div/form/button'
    submit_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_submit_button)))

    STRING_EMAIL = "abc@def.pl"

    # act
    for c in STRING_EMAIL:
        email_window.send_keys(c)
        time.sleep(0.1)

    submit_button.click()
    time.sleep(1)

    # assert
    registration_valid = driver.execute_script("return arguments[0].validity.valid;", password_window)
    assert not registration_valid

def test_no_email(driver):
    # arrange
    driver.get("http://localhost:5173")
    wait = WebDriverWait(driver, 10)

    xpath_register_button = '//*[@id="root"]/div/main/div/div/div[1]/button'
    register_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_register_button)))
    register_button.click()

    xpath_email_window = '//*[@id="root"]/div/main/div/div/form/input[1]'
    email_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_email_window)))

    xpath_password_window = '//*[@id="root"]/div/main/div/div/form/input[2]'
    password_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_password_window)))

    xpath_submit_button = '//*[@id="root"]/div/main/div/div/form/button'
    submit_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_submit_button)))
    
    STRING_PASSWORD = "password123!"

    # act
    for c in STRING_PASSWORD:
        password_window.send_keys(c)
        time.sleep(0.1)

    submit_button.click()
    time.sleep(1)

    # assert
    registration_valid = driver.execute_script("return arguments[0].validity.valid;", email_window)
    assert not registration_valid

def test_invalid_email(driver):
    # arrange
    driver.get("http://localhost:5173")
    wait = WebDriverWait(driver, 10)

    xpath_register_button = '//*[@id="root"]/div/main/div/div/div[1]/button'
    register_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_register_button)))
    register_button.click()

    xpath_email_window = '//*[@id="root"]/div/main/div/div/form/input[1]'
    email_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_email_window)))

    xpath_password_window = '//*[@id="root"]/div/main/div/div/form/input[2]'
    password_window = wait.until(EC.presence_of_element_located((By.XPATH, xpath_password_window)))

    xpath_submit_button = '//*[@id="root"]/div/main/div/div/form/button'
    submit_button = wait.until(EC.element_to_be_clickable((By.XPATH, xpath_submit_button)))

    STRING_EMAIL = "niepoprawny.pl"
    STRING_PASSWORD = "password123!"

    # act
    for c in STRING_EMAIL:
        email_window.send_keys(c)
        time.sleep(0.1)

    for c in STRING_PASSWORD:
        password_window.send_keys(c)
        time.sleep(0.1)

    submit_button.click()
    time.sleep(1)

    # assert
    registration_valid = driver.execute_script("return arguments[0].validity.valid;", email_window)
    assert not registration_valid