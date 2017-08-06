# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(() ->
    $(document).on("click", "a", (event) ->
        target = $(event.currentTarget).attr("href")
        if target.charAt(0) != "#" and target.split("cookies").length > 1
            id = target.split("/")
            ga('send', 'event', 'Button', 'clicked', "cookie", id[id.length - 1]);
        if target.charAt(0) != "#"
            return true
        ga('send', 'event', 'Button', 'clicked', target);
        event.preventDefault()
        $(event.currentTarget).blur()
        top = $(target).offset().top
        $("html, body").animate({
            scrollTop: top
        })
    ).on("click", ".down-arrow", (event) -> 
        top = $(event.currentTarget).closest(".jumbotron").next().offset().top
        $("html, body").animate({
            scrollTop: top
        })
    ).on("click", "#signup-button", (event) ->
        email = $("#signup-email").val()
        ga('send', 'event', 'Button', 'clicked', "signup", email);
    ).on("ajax:success", "#email-signup", (event) ->
        response = JSON.parse(event.originalEvent.detail[2].response)
        if response.error?
            if response.error == "Existing Record"
                $("#email-signup")[0].reset();
                alert("You're signed up!")
            else
                alert("There was an issue saving your information. Please try again later.")
        else
            $("#email-signup")[0].reset();
            alert("You're signed up!")
    ).on("ajax:error", "#email-signup", (event) ->
        alert("There was an issue saving your information. Please try again later.")
    );
)