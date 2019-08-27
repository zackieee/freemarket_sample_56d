$(function(){

  function buildBOX3(category){
    var category_box = `<div name="product[category_id]" id="category_box_3"></div>`
    return category_box;
  }

  function buildBOX4(category){
    var category_box = `<div name="product[category_id]" id="category_box_4"></div>`
    return category_box;
  }

  function buildCHILDREN(value){
    var category_children = `<a href= "/products/category_search/?id=${value.id}" class="second" data-category-id="${value.id}">${value.name}</a>`
    return category_children;
  }
  

  $('.header--select__category').on('mouseover', function(){
    $('.drop-list').addClass("appear")
  })
  $('.header--select__category').on('mouseout', function(){
    $('.drop-list').removeClass("appear")
  })
  
  $('.drop-list').on('mouseover', function(){
    var id = $(this).data("category-id");
    $.ajax({
        url: '/products/get_category_children',
        type: "GET",
        data: { parent_id: id },
        dataType: 'json'
      })
      .done(function(data){
        $('#category_box_3').remove();
        html = buildBOX3(data)
        $(".header--select__category__wrapper__second").append(html);
        data.forEach(function( children ) {
          html = buildCHILDREN(children);
          $("#category_box_3").append(html);
         });
      })
      .fail(function(){
        alert('正しくありません');
      })
  });

  $(document).on('mouseover', ".second", function(){
    var id = $(this).data("category-id");
    $.ajax({
      url: '/products/get_category_grandchildren',
      type: "GET",
      data: { parent_id: id },
      dataType: 'json'
    })
    .done(function(data){
      if (data.length){
        $('#category_box_4').remove();
        html = buildBOX4(data);
        $(".header--select__category__wrapper__third").append(html);
        data.forEach(function( grandchildren ) {
          html = buildCHILDREN(grandchildren);
          $("#category_box_4").append(html);
          });
        };
      })
      .fail(function(){
        alert('正しくありません');
      })
  });
  
  $(document).on('mouseover', "i, p, input, h1, img, .header--select__right, .products--heading__wrapper, .item", function(){
    $('#category_box_3').remove();
    $('#category_box_4').remove();
  })
  $(document).on('mouseout', ".drop-list", function(){
    $('#category_box_3').addClass("hidden")
  })
  $(document).on('mouseover', ".second", function(){
    $('#category_box_3').addClass("appear")
  })
  $(document).on('mouseover', '.drop-list', function(){
    $('#category_box_4').addClass("hidden")
  })
  $(document).on('mouseover', ".second", function(){
    $('#category_box_4').addClass("appear")
  })
});