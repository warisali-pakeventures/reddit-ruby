jQuery ->
  if $('#infinite-scroll').length > 0
#    ajax_loader = imagePath('ajax-loader.gif')
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next_page a').attr('href')
      console.log more_posts_url
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').html('<img src="/assets/images/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_posts_url
      return
    return