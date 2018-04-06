package util;

public class Paging {
	public static String pagingImg(int totalRecordCount, int pageSize, int blockPage, int nowPage, String page) {

		String pagingStr = "";

		// 1.전체페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
		// System.out.println(intTemp);

		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";

		// 처음페이지 & 이전페이지를 위한 로직
		if (intTemp != 1) {

			pagingStr += "<li><a href='" + page
					+ "nowPage=1'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";

			pagingStr += "<li><a href='" + page + "nowPage=" + (intTemp - blockPage) + "'>"
					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
		}
		// 페이지표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
		// 페이지가 될때까지 페이지를 표시한다.
		while (blockCount <= blockPage && intTemp <= totalPage) {
			// 현재 페이지인 경우
			if (intTemp == nowPage) {
				pagingStr += "<li class=\"active\"><a href=\"#\">" + intTemp + "</a></li>";
			} else {
				pagingStr += "<li><a href='" + page + "nowPage=" + intTemp + "'>" + intTemp + "</a></li>";
			}

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		}

		// 다음 및 마지막 페이지를 위한 로직
		if (intTemp <= totalPage) {
			pagingStr += "<li><a href='" + page + "nowPage=" + intTemp + "'>"
					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";

			pagingStr += "<li><a href='" + page + "nowPage=" + totalPage + "'>"
					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";

		}
		pagingStr += "</ul></div>";
		return pagingStr;

	}
	
	public static String pagingAjax(int totalRecordCount, int pageSize, int blockPage, int nowPage, String page) {

		String pagingStr = "";

		// 1.전체페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
		// System.out.println(intTemp);

		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";

		// 처음페이지 & 이전페이지를 위한 로직
		if (intTemp != 1) {

			pagingStr += "<li><a href='javascript:paging(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";

			// 블럭 페이지의 마지막 페이지 번호로
			pagingStr += "<li><a href='javascript:paging(" + (intTemp - 1) + ");'>"
			// 블럭 페이지의 첫번째 페이지번호로
			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
		}

		// 페이지표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
		// 페이지가 될때까지 페이지를 표시한다.
		while (blockCount <= blockPage && intTemp <= totalPage) {
			// 현재 페이지인 경우
			if (intTemp == nowPage) {
				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
			} else {
				pagingStr += "<li><a href='javascript:paging(" + intTemp + ");'>" + intTemp + "</a></li>";
			}

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		}

		// 다음 및 마지막 페이지를 위한 로직
		if (intTemp <= totalPage) {
			pagingStr += "<li><a href='javascript:paging(" + intTemp + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";

			pagingStr += "<li><a href='javascript:paging(" + totalPage + ");'>"
					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";

		}
		pagingStr += "</ul></div>";
		return pagingStr;

	}

	public static String pagingAjax2(int totalRecordCount, int pageSize, int blockPage, int nowPage, String jsFnName) {
		String pagingStr = "";

		// 1.전체페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
		// System.out.println(intTemp);

		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";

		// 처음페이지 & 이전페이지를 위한 로직
		if (intTemp != 1) {

			pagingStr += "<li><a href='javascript:" + jsFnName
					+ "(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";

			// 블럭 페이지의 마지막 페이지 번호로
			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + (intTemp - 1) + ");'>"
			// 블럭 페이지의 첫번째 페이지번호로
			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
		}

		// 페이지표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
		// 페이지가 될때까지 페이지를 표시한다.
		while (blockCount <= blockPage && intTemp <= totalPage) {
			// 현재 페이지인 경우
			if (intTemp == nowPage) {
				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
			} else {
				pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>" + intTemp + "</a></li>";
			}

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		}

		// 다음 및 마지막 페이지를 위한 로직
		if (intTemp <= totalPage) {
			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";

			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + totalPage + ");'>"
					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";

		}
		pagingStr += "</ul></div>";
		return pagingStr;
	}

	


	public static String pagingAjaxMember(int totalRecordCount, SearchMemberCriteria scri, String jsFnName) {
		String pagingStr = "";

		int pageSize = scri.getPageSize();
		int blockPage = scri.getBlockPage();
		int nowPage = scri.getNowPage();

		// 1.전체페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
		// System.out.println(intTemp);

		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";

		// 처음페이지 & 이전페이지를 위한 로직
		if (intTemp != 1) {

			pagingStr += "<li><a href='javascript:" + jsFnName
					+ "(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";

			// 블럭 페이지의 마지막 페이지 번호로
			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + (intTemp - 1) + ");'>"
			// 블럭 페이지의 첫번째 페이지번호로
			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
		}

		// 페이지표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
		// 페이지가 될때까지 페이지를 표시한다.
		while (blockCount <= blockPage && intTemp <= totalPage) {
			// 현재 페이지인 경우
			if (intTemp == nowPage) {
				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
			} else {
				pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>" + intTemp + "</a></li>";
			}

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		}

		// 다음 및 마지막 페이지를 위한 로직
		if (intTemp <= totalPage) {
			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>"
					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";

			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + totalPage + ");'>"
					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";

		}
		pagingStr += "</ul></div>";
		return pagingStr;
	}
}


	
//	public static String pagingImg(int totalRecordCount, int pageSize, int blockPage, int nowPage, String page) {
//
//		String pagingStr = "";
//
//		// 1.전체페이지 구하기
//		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));
//
//		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
//		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
//		// System.out.println(intTemp);
//
//		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";
//
//		// 처음페이지 & 이전페이지를 위한 로직
//		if (intTemp != 1) {
//
//			pagingStr += "<li><a href='" + page
//					+ "nowPage=1'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";
//
//			pagingStr += "<li><a href='" + page + "nowPage=" + (intTemp - blockPage) + "'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
//		}
//
//		// 페이지표시 제어를 위한 변수
//		int blockCount = 1;
//
//		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
//		// 페이지가 될때까지 페이지를 표시한다.
//		while (blockCount <= blockPage && intTemp <= totalPage) {
//			// 현재 페이지인 경우
//			if (intTemp == nowPage) {
//				pagingStr += "<li class=\"active\"><a href=\"#\">" + intTemp + "</a></li>";
//			} else {
//				pagingStr += "<li><a href='" + page + "nowPage=" + intTemp + "'>" + intTemp + "</a></li>";
//			}
//
//			intTemp = intTemp + 1;
//			blockCount = blockCount + 1;
//		}
//
//		// 다음 및 마지막 페이지를 위한 로직
//		if (intTemp <= totalPage) {
//			pagingStr += "<li><a href='" + page + "nowPage=" + intTemp + "'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";
//
//			pagingStr += "<li><a href='" + page + "nowPage=" + totalPage + "'>"
//					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";
//
//		}
//		pagingStr += "</ul></div>";
//		return pagingStr;
//
//	}
//	public static String pagingAjax(int totalRecordCount, int pageSize, int blockPage, int nowPage, String page) {
//
//		String pagingStr = "";
//
//		// 1.전체페이지 구하기
//		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));
//
//		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
//		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
//		// System.out.println(intTemp);
//
//		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";
//
//		// 처음페이지 & 이전페이지를 위한 로직
//		if (intTemp != 1) {
//
//			pagingStr += "<li><a href='javascript:paging(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";
//
//			// 블럭 페이지의 마지막 페이지 번호로
//			pagingStr += "<li><a href='javascript:paging(" + (intTemp - 1) + ");'>"
//			// 블럭 페이지의 첫번째 페이지번호로
//			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
//		}
//
//		// 페이지표시 제어를 위한 변수
//		int blockCount = 1;
//
//		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
//		// 페이지가 될때까지 페이지를 표시한다.
//		while (blockCount <= blockPage && intTemp <= totalPage) {
//			// 현재 페이지인 경우
//			if (intTemp == nowPage) {
//				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
//			} else {
//				pagingStr += "<li><a href='javascript:paging(" + intTemp + ");'>" + intTemp + "</a></li>";
//			}
//
//			intTemp = intTemp + 1;
//			blockCount = blockCount + 1;
//		}
//
//		// 다음 및 마지막 페이지를 위한 로직
//		if (intTemp <= totalPage) {
//			pagingStr += "<li><a href='javascript:paging(" + intTemp + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";
//
//			pagingStr += "<li><a href='javascript:paging(" + totalPage + ");'>"
//					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";
//
//		}
//		pagingStr += "</ul></div>";
//		return pagingStr;
//
//	}
//
//	public static String pagingAjax2(int totalRecordCount, int pageSize, int blockPage, int nowPage, String jsFnName) {
//		String pagingStr = "";
//
//		// 1.전체페이지 구하기
//		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));
//
//		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
//		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
//		// System.out.println(intTemp);
//
//		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";
//
//		// 처음페이지 & 이전페이지를 위한 로직
//		if (intTemp != 1) {
//
//			pagingStr += "<li><a href='javascript:" + jsFnName
//					+ "(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";
//
//			// 블럭 페이지의 마지막 페이지 번호로
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + (intTemp - 1) + ");'>"
//			// 블럭 페이지의 첫번째 페이지번호로
//			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
//		}
//
//		// 페이지표시 제어를 위한 변수
//		int blockCount = 1;
//
//		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
//		// 페이지가 될때까지 페이지를 표시한다.
//		while (blockCount <= blockPage && intTemp <= totalPage) {
//			// 현재 페이지인 경우
//			if (intTemp == nowPage) {
//				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
//			} else {
//				pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>" + intTemp + "</a></li>";
//			}
//
//			intTemp = intTemp + 1;
//			blockCount = blockCount + 1;
//		}
//
//		// 다음 및 마지막 페이지를 위한 로직
//		if (intTemp <= totalPage) {
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";
//
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + totalPage + ");'>"
//					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";
//
//		}
//		pagingStr += "</ul></div>";
//		return pagingStr;
//	}
//	
//	public static String pagingAjaxMember(int totalRecordCount, SearchMemberCriteria scri, String jsFnName) {
//		String pagingStr = "";
//
//		int pageSize = scri.getPageSize();
//		int blockPage = scri.getBlockPage();
//		int nowPage = scri.getNowPage();
//
//		// 1.전체페이지 구하기
//		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));
//
//		// 현재 페이지를 통해 이전 페이지블럭에 해당하는 페이지를 구함 (페이지 블럭의 첫번째 수) 12345 -> 1 678910 -> 6
//		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
//		// System.out.println(intTemp);
//
//		pagingStr += "<div class=\"text-center\"><ul class=\"pagination\">";
//
//		// 처음페이지 & 이전페이지를 위한 로직
//		if (intTemp != 1) {
//
//			pagingStr += "<li><a href='javascript:" + jsFnName
//					+ "(1);'> <span class=\"glyphicon glyphicon-backward\"></span></a></li>";
//
//			// 블럭 페이지의 마지막 페이지 번호로
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + (intTemp - 1) + ");'>"
//			// 블럭 페이지의 첫번째 페이지번호로
//			// pagingStr += "<li><a href='javascript:paging("+(intTemp - blockPage) + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-left\"></span></a></li>";
//		}
//
//		// 페이지표시 제어를 위한 변수
//		int blockCount = 1;
//
//		// 페이지를 뿌려주는 로직 : 블럭페이지 수만큼 혹은 마지막
//		// 페이지가 될때까지 페이지를 표시한다.
//		while (blockCount <= blockPage && intTemp <= totalPage) {
//			// 현재 페이지인 경우
//			if (intTemp == nowPage) {
//				pagingStr += "<li class=\"active\"><a href=\"javascript:;\">" + intTemp + "</a></li>";
//			} else {
//				pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>" + intTemp + "</a></li>";
//			}
//
//			intTemp = intTemp + 1;
//			blockCount = blockCount + 1;
//		}
//
//		// 다음 및 마지막 페이지를 위한 로직
//		if (intTemp <= totalPage) {
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + intTemp + ");'>"
//					+ "<span class=\"glyphicon glyphicon-chevron-right\"></span></a></li>";
//
//			pagingStr += "<li><a href='javascript:" + jsFnName + "(" + totalPage + ");'>"
//					+ "<span class=\"glyphicon	glyphicon-forward\"></span></a></li>";
//
//		}
//		pagingStr += "</ul></div>";
//		return pagingStr;
//	}
//
//}
