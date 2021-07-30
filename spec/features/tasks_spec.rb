require 'rails_helper'

RSpec.feature 'Tasks', type: :feature do
  let(:task) { create(:task) }

  context 'create a new task' do
    scenario 'should to return a message error' do
      visit new_task_path

      within('form') do
        fill_in 'Descrição', with: ''
        find(:css, '#task_status').find(:option, 'A fazer').select_option
      end

      click_button 'Criar'
      
      expect(page).to have_content('Descrição não pode ficar em branco')
    end

    scenario 'should be succesful' do
      visit new_task_path
      
      within('form') do
        fill_in 'Descrição', with: 'Primeiro teste'
        find(:css, '#task_status').find(:option, 'A fazer').select_option
      end

      click_button 'Criar'

      expect(page).to have_content('criada com sucesso')
    end
  end

  context 'edit a task' do
    scenario 'should to return a message error' do
      visit edit_task_path(task)

      within('form') do
        fill_in 'Descrição', with: ''
        find(:css, '#task_status').find(:option, 'Cancelado').select_option
      end

      click_button 'Atualizar'
      
      expect(page).to have_content('Descrição não pode ficar em branco')
    end
    
    scenario 'should be succesful' do
      visit task_path(task)
      expect(page).to_not have_content('Updated description')
      expect(page).to have_content("John to change name to Paul")
      visit edit_task_path(task)

      within('form') do
        fill_in 'Descrição', with: 'Updated description'
        find(:css, '#task_status').find(:option, 'A fazer').select_option
      end

      click_button 'Atualizar'
      
      expect(page).to have_content('Updated description')
      expect(page).to have_content('atualizada com sucesso')
    end
  end

  context 'destroy one task' do
    scenario 'should be succesful' do
      visit tasks_path(task)
      expect(page).to have_content("John to change name to Paul")

      click_button 'Excluir'
      
      expect(page).to_not have_content("John to change name to Paul")
    end
  end

  context 'mark as' do
    context 'done' do
      scenario 'should be succesful' do
        visit tasks_path(task)
        expect(page).to have_content("Concluir")
        expect(page).to_not have_content("Desmarcar concluído")
        
        click_link 'Concluir'
        
        expect(page).to_not have_content("Concluir")
        expect(page).to have_content("Desmarcar concluído")
      end
    end

    context 'undone' do
      before do
        Task.create(description: 'Testing', status: :done)
      end

      scenario 'should be succesful' do
        visit tasks_path(task)
        expect(page).to have_content("Desmarcar concluído")
        
        click_link 'Desmarcar concluído'
        
        expect(page).to_not have_content("Desmarcar concluído")
      end
    end
  end
end