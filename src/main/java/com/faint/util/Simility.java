package com.faint.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.faint.dto.ActivityDTO;

/*
 * 유사도를 구하는 함수
 */
public class Simility {
   
        
      
      //코사인유사도
     public  static double cosineSimilarity(double[] vectorA, double[] vectorB) {
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
     public static double[][] getActScore(List<ActivityDTO> activity){
           
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
     public static  ArrayList<Integer> sort(double[][] actScore){
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
             if(actScore[i][1]>0.1)  {    //유사도가 0.1이상만 추천받도록(테스트 유저가 넘 적음 ㅠㅠ)
                reList.add((int)actScore[i][0]);            
             }
          }
          
          
          
          return reList;
     }
     
    
     //ActivityDTO 추천받을 Id값을 (1,2,3) 형식의 String값으로 반환, 없으면 () 으로 반환
     public static ArrayList<Integer> getRecomId(List<ActivityDTO> activity){
           
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
          
          return reList;

          
     }
     
     
     
     
     
     
   
   
}