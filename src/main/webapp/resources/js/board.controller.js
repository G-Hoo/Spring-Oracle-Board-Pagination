var jyp = jyp || {};

/*========= jyp-context =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : context
=================================*/
jyp.context = (function() {
    var onCreate = function(context) {
        $.getScript(context + '/resources/js/board.domain.js', function() {
            $.extend(new Session(context));
            setContentView();
        });
    };
    var setContentView = function() {
        jyp.controller.onCreate();
    };
    return {
        onCreate: onCreate
    };
})();

/*========= jyp-cookie =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : controller
=================================*/
jyp.cookie = {
    setCookie: function(name, value) {
        document.cookie = name + "=" + encodeURIComponent(value);
    },
    getCookie: function(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
        }
        return null;
    },
    removeCookie: function(name) {
        jyp.cookie.setCookie(name, '', -1);
    }
}

/*========= jyp-controller =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : controller
=================================*/
jyp.controller = (function() {
    var service, view, css, cookie;

    var onCreate = function() {
        service = $.javascript() + '/board.service.js';
        view = $.javascript() + '/board.view.js';
        css = $.javascript() + '/board.css.js';
        cookie = $.javascript() + '/util.cookie.js'
        setContentView();
    };

    var setContentView = function() {
        $.when(
            $.getScript(service),
            $.getScript(view),
            $.getScript(css),
            $.getScript(cookie),
            $.Deferred(function(deferred) {
                $(deferred.resolve);
            })
        ).done(function() {
        	boardMain(1);
        });
    };
    
    var boardMain = function(pageNo){
	$('#wrapper').html(boardView());
	    $.ajax({
		    url : $.context() + '/board/pagination/' + pageNo,
		    method : 'POST',
		    data : JSON.stringify({
		        pageNo : pageNo
		    }),
		    dataType : 'json',
		    contentType : 'application/json',
		    success : function(data){
		        console.log(data.list);
		        $('#count').text(data.theNumberOfRows);
		        $.each(data.list, function(i,o){
				    $('#board_list').append(boardListContent(i));
		            $('#seq'+i).text(o.seq);
		            $('#userid'+i).text(o.id);
		            $('#title'+i).text(o.title);
		            $('#date'+i).text(o.regdate);
		            $('#count'+i).text(o.readCount);
		        });
		        if(jyp.cookie.getCookie('login')=='Y'){
		            $('#write').after('<a id="logout" href="#"><input type="button" value="로그아웃" style="background: white;  margin-bottom: 70px; margin-left: 20px"/></a>');
		        }
		        
		        if(data.prevBlock>0){
		            $('#pagination').append(prevBlock());
		            $('#prevBlock').on('click',function(){
		        	boardMain(data.prevBlock);
		            });
		        }
		        for(var i=data.startPage; i<=data.endPage; i++){
		            if(i==data.pageNumber){
		        		$('#pagination').append('<li><a href="javascript:void(0)">'+i+'</a></li>');
		            } else {
		        		$('#pagination').append('<li><a id="page'+i+'" class="goPage" href="javascript:void(0)">'+i+'</a></li>');
		            }
		        }
		        if(data.nextBlock<=data.theNumberOfPages){
		            $('#pagination').append(nextBlock());
		            $('#nextBlock').on('click',function(){
		        	boardMain(data.nextBlock);
		            });
		        }
		        $('.goPage').on('click',function(){
		           boardMain($(this).attr('id').split('page')[1]); 
		        });
		    },
		    error : function(x,s,m){
		        alert(m);
		    }
	    });
	    $('#write').on('click',function(){
		    write();
	    });
	};
	
	var write = function(){
	    $('#wrapper').html(writeView());
	    $('#cancel').on('click',function(){
		boardMain(1);
	    });
	    $('#write').on('click',function(){
		var title = $('#title').val();
		var content = $('#content').val();
		$.ajax({
		      url : $.context() + '/board/write',
		      method : 'POST',
		      data : JSON.stringify({
			  title : title, content : content
		      }),
		      dataType : 'json',
		      contentType : 'application/json',
		      success : function(data){
			  alert('글쓰기 성공!!');
			  boardMain(1);
		      },
		      error : function(x,s,m){
		          alert(m);
		      }
		    });
	    });
	};
    return {
        onCreate: onCreate
    }
})();