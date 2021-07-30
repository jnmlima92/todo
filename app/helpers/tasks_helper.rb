module TasksHelper
  def done_button(status)
    status == 'done' ? 'mark_as_undone' : 'mark_as_done'
  end
end
