
function boardView(){
    return '<div style="padding: 50px"></div>'
    +'<div style="width:100%">'
    +'<div style="margin: 0 auto; text-align:center; width: 700px">'
    +'	<table id="board_list" class="table table-hover">'
    +'		<tr>'
    +'			<td colspan="5">총 게시글 수 : <b id="count"></b>건</td>'
    +'		</tr>'
    +'		<tr>'
    +'			<td>Seq</td>'
    +'			<td>사용자 ID</td>'
    +'			<td>제목</td>'
    +'			<td>작성일</td>'
    +'			<td>카운트</td>'
    +'		</tr>'		
    +'	</table>'
    +'	<nav aria-label="Page navigation">'
    +'	  <ul id="pagination" class="pagination">'
    +'	  </ul>'
    +'	</nav>'
    +'  <div style="text-align: right"><a id="write" href="#"><input type="button" value="글쓰기" style="background: white;  margin-bottom: 70px;"/></a></div>'
    +'</div>'
    +'</div>';
}

function boardListContent(i){
    return '<tr>'
    +'			<td id="seq'+i+'" class="seq">1</td>'
    +'			<td id="userid'+i+'" class="userid">babungv</td>'
    +'			<td><a id="title'+i+'" class="title" href="javascript:void(0)">title1</a></td>'
    +'			<td id="date'+i+'" class="regdate">2017-06-05</td>'
    +'			<td id="count'+i+'" class="readcount">0</td>'
    +'		</tr>';
}
function prevBlock(){
    return '<li id="previous">'
    +'	      <a id="prevBlock" href="#" aria-label="Previous">'
    +'	        <span aria-hidden="true">&laquo;</span>'
    +'	      </a>'
    +'	    </li>';
}
function nextBlock(){
    return '<li id="next">'
    +'	      <a id="nextBlock" href="#" aria-label="Next">'
    +'	        <span aria-hidden="true">&raquo;</span>'
    +'	      </a>'
    +'	    </li>';
}
function writeView(){
    return '<div style="padding: 50px"></div>'
    +'<div style="width:100%">'
    +'	<div style="margin: 0 auto; width: 339px">'
    +'		<ul class="list-group">'
    +'  			<li class="list-group-item list-group-item-success"><input id="title" type="text" placeholder="제목"/></li>'
    +'  			<li class="list-group-item list-group-item-success"><textarea name="" id="content" cols="40" rows="10" placeholder="내용"></textarea></li>'
    +'  			<li class="list-group-item list-group-item-success"><a id="cancel" href="javascript:void(0)"><input type="button" value="취소"/></a><a id="write" href="javascript:void(0)"><input type="button" value="글쓰기"/></a></li>'
    +'		</ul>'
    +'	</div>'
    +'</div>'
}
