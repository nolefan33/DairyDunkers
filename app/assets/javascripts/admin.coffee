# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(() ->
    $(document).on("ajax:success", "#add-cookie-form", (event) ->
        response = JSON.parse(event.originalEvent.detail[2].response)
        if response.error?
            if response.error.photo? or response.error.title? or response.error.description?
                alert("All fields are required.")
            else
                alert("There was an issue saving the cookie. Please try again later.")
        else
            $("#cookie-list").append("<div class='row cookie-row' data-id='#{response.id}'>
                <form action='/cookies/#{response.id}' accept-charset='UTF-8' data-remote='true' method='post'>
                    <input name='utf8' type='hidden' value='✓'>
                    <input type='hidden' name='_method' value='delete'>
                    <div class='col-xs-8'>
                        <p>#{$("#add-cookie-form #title").val()}</p>
                    </div>
                    <div class='col-xs-4'>
                        <input type='submit' name='commit' value='Delete Cookie' class='btn btn-danger btn-sm' data-confirm='Are you sure you wish to delete this cookie?'' data-disable-with='Delete Cookie'>
                    </div>
                </form>
            </div>")
            $("#add-cookie-form")[0].reset();
            alert("Cookie added!")
    ).on("ajax:error", "#add-cookie-form", (event) ->
        alert("There was an issue saving the cookie. Please try again later.")
    ).on("ajax:success", "#add-admin-form", (event) ->
        response = JSON.parse(event.originalEvent.detail[2].response)
        if response.error?
            if response.error.password?
                alert("Password " + response.error.password)
            else if response.error.email?
                alert("Email " + response.error.email)
            else
                alert("There was an issue adding the admin. Please try again later.")
        else
            $("#add-admin-form")[0].reset();
            alert("Admin added!")
    ).on("ajax:error", "#add-admin-form", (event) ->
        alert("There was an issue adding the admin. Please try again later.")
    ).on("ajax:success", ".delete-cookie-form", (event) ->
        response = JSON.parse(event.originalEvent.detail[2].response)
        if response.error?
            alert("There was an issue deleting the cookie. Please try again later.")
        else
            $(".cookie-row[data-id=#{response.id}]").remove()
            alert("Cookie Deleted.")
    ).on("ajax:error", ".delete-cookie-form", (event) ->
        alert("There was an issue deleting the cookie. Please try again later.")
    )
)