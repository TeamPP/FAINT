package com.faint.sns;

import static org.junit.Assert.*;

import java.util.*;


import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;
import com.faint.persistence.ActivityDAO;
import com.faint.persistence.TagDAO;
import com.faint.service.ActivityService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@WebAppConfiguration

public class similarityTest2 {
   
	@Inject
	private ActivityDAO dao;
   
	@Inject
	private ActivityService service;

   
   
   //corr 상관계수
/*     public static double Correlation(int[] xs, int[] ys) {
          //TODO: check here that arrays are not null, of the same length etc

          double sx = 0.0;
          double sy = 0.0;
          double sxx = 0.0;
          double syy = 0.0;
          double sxy = 0.0;

          int n = xs.length;

          for(int i = 0; i < n; ++i) {
            double x = xs[i];
            double y = ys[i];

            sx += x;
            sy += y;
            sxx += x * x;
            syy += y * y;
            sxy += x * y;
          }

          // covariation
          double cov = sxy / n - sx * sy / n / n;
          // standard error of x
          double sigmax = Math.sqrt(sxx / n -  sx * sx / n / n);
          // standard error of y
          double sigmay = Math.sqrt(syy / n -  sy * sy / n / n);

          // correlation is just a normalized covariation
          return cov / sigmax / sigmay;
        }*/
   


	   //코사인유사도
	  public  double cosineSimilarity(double[] vectorA, double[] vectorB) {
	       double dotProduct = 0.0;  //벡터의 내적 각 원소를 짝지어서 곱한뒤 합산
	       double normA = 0.0;
	       double normB = 0.0;
	       for (int i = 0; i < vectorA.length; i++) {
	           dotProduct += vectorA[i] * vectorB[i];
	           normA += Math.pow(vectorA[i], 2);
	           normB += Math.pow(vectorB[i], 2);
	       }   
	       return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
	   }
	  
	  
	  //활동표 점수를 2차원 배열로 넣기
	  public double[][] getActScore(List<ActivityDTO> activity){
		  	
		  	//list-->array 변경
			ActivityDTO[] array=activity.toArray(new ActivityDTO[activity.size()]);
		  
			//2차원 배열에 넣기
			double[][] t=new double[activity.size()][15];
			
			for(int i=0; i<activity.size(); i++){
			t[i][0]=array[i].getC1PostCnt();
			t[i][1]=array[i].getC2PostCnt();
			t[i][2]=array[i].getC3PostCnt();
			t[i][3]=array[i].getC4PostCnt();
			t[i][4]=array[i].getC5PostCnt();
			
			t[i][5]=array[i].getC1ReplyCnt();
			t[i][6]=array[i].getC2ReplyCnt();
			t[i][7]=array[i].getC3ReplyCnt();
			t[i][8]=array[i].getC4ReplyCnt();
			t[i][9]=array[i].getC5ReplyCnt();
			
			t[i][10]=array[i].getC1LikeCnt();
			t[i][11]=array[i].getC2LikeCnt();
			t[i][12]=array[i].getC3LikeCnt();
			t[i][13]=array[i].getC4LikeCnt();
			t[i][14]=array[i].getC5LikeCnt();
			
			
			//활동표 출력
			System.out.println(array[i].getUserid()+"   :"+Arrays.toString(t[i]));
			}
			return t;
	  }
	  
	  
	  //actScore를 유사도 기준으로 정렬하고 추천받는 유저의 번호만 list형식으로 리턴함
	  public  ArrayList<Integer> sort(double[][] actScore){
		    //배열복사_유사도에 따른 정렬을 위해서
		    double[][] tmp=new double[1][2]; 
		    
		    for(int i=actScore.length-1; i>0 ; i--){
		        for(int j=0; j<i; j++){
		        	if(actScore[j][1]<actScore[j+1][1]){
		            	tmp[0]=actScore[j+1];
		            	actScore[j+1]=actScore[j];
		            	actScore[j]=tmp[0];
		            }
		        }
		    }
		    
		    //추천할 유저의 id를 리스트에 넣기
		    ArrayList<Integer> reList=new ArrayList<Integer>();
		    for(int i=0; i<actScore.length; i++){
		    	if(actScore[i][1]>0.3)  {    //유사도가 0.3이상만 추천받도록
		    		reList.add((int)actScore[i][0]);      		
		    	}
		    }
		    
		    
		    
		    return reList;
	  }
	  
	 
	  //ActivityDTO List를 받는 함수_id값과 유사도를 2차원 배열의 값으로 return 함
	  public  String getRecomId(List<ActivityDTO> activity){
		  	
		  //활동점수만 2차원 배열로 넣기
			double[][] t=getActScore(activity);
			
			//유사도를 구한뒤 arr에 넣기
			//t[0]는 매개변수로 받은 userid의 활동표
			double[] simility=new double[activity.size()];
			for(int i=0; i<activity.size(); i++){
				simility[i]=cosineSimilarity(t[0], t[i]);
			}	
		    
			
		  double[][] actScore=new double[activity.size()-1][2];  //자기자신은 제외
		   
			//정리
		    for (int i = 0; i < activity.size()-1; i++) {
		        actScore[i][0]=activity.get(i+1).getUserid();   //id 자기자신은 제외
		        
		        //코사인유사도
		        if(Double.isNaN(simility[i+1])){   //NaN값이라면 0으로 대체
		        	actScore[i][1]=0; 
		        } else {  //유사도 있으면 넣어주기
		        	actScore[i][1]=simility[i+1];
		        }
			}
		    
		    //유사도 결과 출력
		    System.out.println("유사도 결과");
		    for(int i=0; i<actScore.length; i++){
		    	System.out.println("id: "+(int)actScore[i][0] +"          코사인유사도: "+actScore[i][1] );		    	
		    }
		    
		    //유사도 내림차순 정렬하고 0.3이상 id만 reList로 반환
		    ArrayList<Integer> reList=sort(actScore);
		    System.out.println("추천할 아이디 번호:        " +reList);
		    
		    
		    //() 괄호안에 추천 아이디를 넣는 String으로 변환
		    // id값이 ()에 담긴 String 만들기
		    // ex.(1,2,3)
		 String reListString="(";
			  
			  Iterator it=reList.iterator();
			  while(it.hasNext()){
				  reListString+=it.next()+",";
			  }

			  
			  //마지막 글자가 , 일때만 , 지우기   ex. (1,2,
			  String lastCha=reListString.charAt(reListString.length()-1)+"";
			  if(lastCha.equals(",")){
				  reListString=reListString.substring(0,reListString.length()-1);			  
			  }
			  reListString+=")";
			  System.out.println("reListString :  "+reListString); 
		
		    
		    
		    return reListString;
		    
	  }
	  
	  
	  
/*	  @Test
		public void test()throws Exception{
		  List<ActivityDTO> activity=dao.activityTbl(4);   //아이디 7
		  
		  String reId=getRecomId(activity);
		  System.out.println("reId:     "+reId);

		  //id:4 ->5,1
		  //id:5->18,3

	  }*/
	  
	  /*	  @Test
		public void test()throws Exception{
		  List<ActivityDTO> activity=dao.activityTbl(4);   //아이디 7
		  
		  String reId=getRecomId(activity);
		  System.out.println("reId:     "+reId);

		  //id:4 ->5,1
		  //id:5->18,3

	  }*/
	  
	  
	  
	  @Test
		public void test()throws Exception{
		  
		  //String reId="(1,2,3)";
		  List<UserVO> uerList=service.recomm(4); //id 4번이 추천받는 UserVO 객체 리스트를 반환
		  System.out.println(uerList);

		  //id:4 ->5,1
		  //id:5->18,3
	  }

	

}