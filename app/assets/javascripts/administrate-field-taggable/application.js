// ActsAsTaggableOn Administrate Form
$(function() {
  $(".field-unit--acts-as-taggable .field-unit__field > input").each(function(elem) {
    var $this = $(this);
    var opts = $this.data('tag-options');

    $this.selectize({
      delimiter: ", ",
      persist: false,
      options: opts,
      create: function(input) {
        return {
          value: input,
          text: input
        };
      }
    });
  })
});
