function ready(callback) {
  $(document).ready(callback);
  $(document).on('page:load', callback);
}

window.ready = ready;
