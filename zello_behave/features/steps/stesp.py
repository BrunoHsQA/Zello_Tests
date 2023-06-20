from behave import given, when, then
from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


@given('que Estou na página inicial do Zello')
def go_to_page(context):
    context.browser = Chrome()
    context.browser.get('http://127.0.0.1:5500/zello.html#!/')

@when('Crio um novo quadro com o nome "Meu Quadro"')
def create_board(context):
    element = context.browser.find_element(By.XPATH, '//*[@id="trello-app"]//div//div[7]').click()
    wait = WebDriverWait(context.browser, 4)
    element = wait.until(EC.visibility_of_element_located((By.XPATH, "/html/body/div//div/div/div/input")))
    
    element = context.browser.find_element(By.XPATH, '//*[@id="trello-app"]//div//div/input').send_keys('Meu Quadro')
    
    element = context.browser.find_element(By.XPATH, './/*[@id="trello-app"]//div//div//button').click()

@then('Vejo o quadro "Meu Quadro" criado com sucesso')
def verification(context):
    expected_text = 'Meu Quadro'
    actual_text = context.browser.page_source
    assert expected_text in actual_text, f'Text "{expected_text}" not found on the page'
