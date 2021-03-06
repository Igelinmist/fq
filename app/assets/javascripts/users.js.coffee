# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  grants = Number($('input[id=user_grants]').val())
  $('input[name=can_read_subdivision_data]').attr('checked',true) if (grants & 1) == 1
  $('input[name=can_edit_subdivision_data]').attr('checked',true) if (grants & 2) == 2
  $('input[name=can_correct_subdivision_data]').attr('checked',true) if (grants & 4) == 4
  $('input[name=can_view_subdivision_report]').attr('checked',true) if (grants & 8) == 8
  $('input[name=can_read_filial_data]').attr('checked',true) if (grants & 16) == 16
  $('input[name=can_edit_filial_data]').attr('checked',true) if (grants & 32) == 32
  $('input[name=can_correct_filial_data]').attr('checked',true) if (grants & 64) == 64
  $('input[name=can_view_filial_report]').attr('checked',true) if (grants & 128) == 128
  $('input[name=can_administrate_users]').attr('checked',true) if (grants & 256) == 256
  $('input[name=can_use_coil]').attr('checked',true) if (grants & 512) == 512
  $('input[name=can_use_gaz]').attr('checked',true) if (grants & 1024) == 1024
  $('input[name=can_use_masut]').attr('checked',true) if (grants & 2048) == 2048


  $('input:checkbox').click( ->

    grants = 0
    if ($(this).attr('name') == 'can_edit_subdivision_data') and ($(this).prop('checked'))
      $('input[name=can_read_subdivision_data]').attr('checked',true)
      $('input[name=can_correct_subdivision_data]').attr('checked',true)
    if ($(this).attr('name') == 'can_correct_subdivision_data') and ($(this).prop('checked'))
      $('input[name=can_read_subdivision_data]').attr('checked',true)
    if ($(this).attr('name') == 'can_edit_filial_data') and ($(this).prop('checked'))
      $('input[name=can_read_filial_data]').attr('checked',true)
      $('input[name=can_correct_filial_data]').attr('checked',true)
    if ($(this).attr('name') == 'can_correct_filial_data') and ($(this).prop('checked'))
      $('input[name=can_read_filial_data]').attr('checked',true)

    $('input:checked').each( ->

      grants |= Number($(this).val())
    )
    $('input[id=user_grants]').val(grants)

  )
