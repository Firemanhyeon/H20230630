document.querySelectorAll('#page-content-wrapper table')
          .tables.forEach(function (tbl) {
				tbl.innerTextHTML="";
});
document.querySelectorAll('#page-content-wrapper h3')
          .tables.forEach(function (elem) {
				elem.remove();
});

const array1=['a','b','c'];
array1.forEach(function(element,idx,ary){
	console.log(element,idx,ary);
})