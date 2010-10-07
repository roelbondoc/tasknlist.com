    $(document).ready(function() {
      $('input#list_title, input.task_title').live('focus',function() {
        $(this).addClass('edit').removeClass('noedit');
      }).live('blur',function() {
        $(this).addClass('noedit').removeClass('edit');
      });

      // Update list title
      $('#list_title').blur(function() {
        $.post('/lists/'+list_id,{'_method':'PUT','list[title]':$(this).val()});
        document.title = $(this).val();
      });

      // Add task
      $('#new_task_form').submit(function() {
        if($('#task_title').val()) {
          $.post('/tasks',{'list_id':list_id,'task[title]':$('#task_title').val()},function(r){
            $('#tasks').html($(r).find('#tasks').html());
            $('.checkbox').hide();
          });
          $('#task_title').val('');
        }
        return false;
      });

      // Update task
      $('.task_title').live('blur',function() {
        if($(this).val()) {
          $.post('/tasks/'+$(this).parent()[0].id,{'_method':'PUT','task[title]':$(this).val(),'list_id':list_id});
        }
      });

      // Mark/unmark task
      $('.checkbox').live('change',function() {
        $.post('/tasks/'+$(this).parent()[0].id,{'list_id':list_id,'_method':'PUT','task[complete]':$(this).attr('checked')});
      });

      // Mark/unmark task
      $('.status').live('click',function() {
        var cbx = $(this).siblings('.checkbox')[0];
        $(cbx).click();
        $.post('/tasks/'+$(this).parent()[0].id,{'list_id':list_id,'_method':'PUT','task[complete]':$(cbx).attr('checked')});
        if($(cbx).attr('checked')) {
          $(this).addClass('complete').removeClass('incomplete');
        }
        else {
          $(this).addClass('incomplete').removeClass('complete');
        }
      });

      $('.checkbox').hide();
    });
