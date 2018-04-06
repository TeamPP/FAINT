function checkImageType(fileName) {
	var pattern = /jpg$|gif$|png$|jpeg$/i;

	return fileName.match(pattern);

}
function checkVideoType(fileName) {
	var pattern = /mp4$|ogg$/i;

	return fileName.match(pattern);

}
function getFileInfo(fullName) {
	var fileName,
		imgsrc,
		getLink,
		fileType;

	var fileLink;
	//이미지타입인경우
	if (checkImageType(fullName) || checkVideoType(fullName)) {
		imgsrc = "/displayFile?fileName=" + fullName;
		fileLink = fullName.substr(14);

		var front = fullName.substr(0, 12); // /2015/07/01/ 
		var end = fullName.substr(14);

		getLink = "/displayFile?fileName=" + front + end;
		
		if(checkImageType(fullName)) fileType = "image";
		else fileType ="video";

	} else {
		//이미지, 동영상 아닌경우
		imgsrc = "/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName=" + fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);

	return {
		fileName : fileName,
		imgsrc : imgsrc,
		getLink : getLink,
		fullName : fullName,
		fileType : fileType
	};

}