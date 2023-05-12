function doLike(pid, uid) {
    console.log(pid, uid);

    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() === 'true') {
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    })

}

function doComment(pid, uid, comment) {
    const cmt = {
        uid: uid,
        pid: pid,
        cmt: comment,
    }

    $.ajax({
        url: "CommentServlet",
        data: cmt,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data) {
                console.log("sdfg");
                $("#cmt").val('');

                return true;
            }
            return false;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
            return false;
        }
    })
    return false;
}



