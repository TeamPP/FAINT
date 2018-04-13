$(document).ready(function(){
    
    var $heart = $('.heart'),
        $addComment = $('.photo__add-comment'),
        $ellipsis = $('.fa-ellipsis-h'),
        $popUp = $('.popUp'),
        $closePopup = $('.fa-times'),
        $closePopUpBtn = $('.closePopUpBtn');

    $heart.click(function(){
        var likes = $(this).parent().parent()
                    .children('.photo__likes')
                    .children('.photo__likes-number'),
            likesNumber = parseInt(likes.html()),
            newValue
        if($(this).hasClass('fa-heart-o')){
            newValue = likesNumber + 1;
        } else{
            newValue = likesNumber - 1;
        }
        likes.html(newValue)
        $(this).toggleClass('fa-heart-o fa-heart');
    });

    $addComment.keydown(function(event){
        // Detect if the key is enter
        if(event.keyCode == 13){
            // Save the textarea's value
            var newComment = event.target.value;
            // Select the comment list above textarea
            var commentList = $(this).parent().parent().children('.photo__comments');
            // Empty the value of textarea and show placehodler again
            $(this).val('').blur();
            // Append a <li> to photo__comments.
            commentList.append("<li class='photo__comment'>\
                <span class='photo__comment-author'>serranoarevalo</span> "
            + newComment +  "</li>");
        }
    })

    $ellipsis.click(function(){
        //show popup
        $popUp.fadeIn();
    })

    $closePopup.click(closePopup);
    $closePopUpBtn.click(closePopup);

    function closePopup(event){
        event.preventDefault()
        $popUp.fadeOut();
    }


})