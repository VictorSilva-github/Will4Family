
  document.addEventListener('DOMContentLoaded', function() {
    const messageTypeSelect = document.getElementById('message_type_select');
    const messageInput = document.getElementById('message_input');

    messageTypeSelect.addEventListener('change', function() {
      if (messageTypeSelect.value === 'Message') {
        messageInput.disabled = false;
      } else {
        messageInput.disabled = true;
      }
    });
  });
