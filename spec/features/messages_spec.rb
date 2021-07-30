require 'rails_helper'

RSpec.feature 'Messages', type: :feature do
  let(:message) { create(:message) }

  context 'create a new message' do
    scenario 'should to return a message error' do
      visit new_message_path

      within('form') do
        fill_in 'Descrição', with: ''
        fill_in 'Cor em hexadecimal', with: ''
        find(:css, '#message_message_type').find(:option, 'Mensagem de Sucesso').select_option
      end

      click_button 'Criar'
      
      expect(page).to have_content('Descrição não pode ficar em branco')
      expect(page).to have_content('Cor em hexadecimal não pode ficar em branco')
    end

    scenario 'should be succesful' do
      visit new_message_path
      
      within('form') do
        fill_in 'Descrição', with: 'Primeiro teste'
        fill_in 'Cor em hexadecimal', with: '#0F5417'
        find(:css, '#message_message_type').find(:option, 'Mensagem de Sucesso').select_option
      end

      click_button 'Criar'

      expect(page).to have_content('criada com sucesso')
    end
  end

  context 'edit a message' do
    scenario 'should to return a message error' do
      visit edit_message_path(message)

      within('form') do
        fill_in 'Descrição', with: ''
        find(:css, '#message_message_type').find(:option, 'Mensagem de Sucesso').select_option
      end

      click_button 'Atualizar'
      
      expect(page).to have_content('Descrição não pode ficar em branco')
    end
    
    scenario 'should be succesful' do
      visit message_path(message)
      expect(page).to_not have_content('Updated description')
      expect(page).to have_content("John to change name to Paul")
      visit edit_message_path(message)

      within('form') do
        fill_in 'Descrição', with: 'Updated description'
        find(:css, '#message_message_type').find(:option, 'Mensagem de Sucesso').select_option
      end

      click_button 'Atualizar'
      
      expect(page).to have_content('Updated description')
      expect(page).to have_content('atualizada com sucesso')
    end
  end

  context 'destroy one message' do
    let(:messages_count) { Message.count }
    
    scenario 'should be succesful' do
      visit messages_path(message)
      expect(page).to have_content("John to change name to Paul")
      expect(page).to have_button('Excluir', count: messages_count)

      click_button 'Excluir', match: :first
      
      expect(page).to have_content('Ver', count: messages_count - 1)
    end
  end
end