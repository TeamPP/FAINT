package com.faint.util;

import java.util.*;

public class PageRank {

	public int path[][];
	public double pagerank[];
	
	public PageRank(int totalNodes){
		this.path=new int[totalNodes][totalNodes];
		this.pagerank=new double[totalNodes];
	}
	public int calc(double totalNodes) {

		double InitialPageRank;
		double OutgoingLinks = 0;
		double DampingFactor = 0.85;
		double TempPageRank[] = new double[(int)totalNodes];

		int ExternalNodeNumber;
		int InternalNodeNumber;
		int k = 0; // For Traversing
		int ITERATION_STEP = 1;

		InitialPageRank = 1 / totalNodes;
		System.out.printf(" Total Number of Nodes :" + totalNodes + "\t Initial PageRank  of All Nodes :"
				+ InitialPageRank + "\n");

		// 0th ITERATION _ OR _ INITIALIZATION PHASE
		for (k = 0; k < totalNodes; k++) {
			this.pagerank[k] = InitialPageRank;
		}

		System.out.printf("\n Initial PageRank Values , 0th Step \n");
		for (k = 0; k < totalNodes; k++) {
			System.out.printf(" Page Rank of " + k + " is :\t" + this.pagerank[k] + "\n");
		}

		while (ITERATION_STEP <= 6) // Iterations
		{
			// Store the PageRank for All Nodes in Temporary Array
			for (k = 0; k < totalNodes; k++) {
				TempPageRank[k] = this.pagerank[k];
				this.pagerank[k] = 0;
			}

			for (InternalNodeNumber = 0; InternalNodeNumber < totalNodes; InternalNodeNumber++) {
				for (ExternalNodeNumber = 0; ExternalNodeNumber < totalNodes; ExternalNodeNumber++) {
					if (this.path[ExternalNodeNumber][InternalNodeNumber] == 1) { //external유저가 팔로우를 받고있는지? 받고있다면-아래내용 실행
						k = 0;
						OutgoingLinks = 0; // Count the Number of Outgoing Links
											// for each ExternalNodeNumber
						while (k < totalNodes) { //external유저를 팔로우하는 유저의 전체 팔로우 중에서의 비중
							if (this.path[ExternalNodeNumber][k] == 1){
								OutgoingLinks = OutgoingLinks + 1; // Counter for Outgoing Links
							}
							k = k + 1;
						}
						// Calculate PageRank
						this.pagerank[InternalNodeNumber] += TempPageRank[ExternalNodeNumber] * (1 / OutgoingLinks);
					}
				}
			}

			System.out.printf("\n After " + ITERATION_STEP + "th Step \n");

			for (k = 0; k < totalNodes; k++)
				System.out.printf(" Page Rank of " + k + " is :\t" + this.pagerank[k] + "\n");

			ITERATION_STEP = ITERATION_STEP + 1;
		}

		// Add the Damping Factor to PageRank // 가중치
		for (k = 0; k < totalNodes; k++) {
			this.pagerank[k] = (1 - DampingFactor) + DampingFactor * this.pagerank[k];
		}

		// Display PageRank
		System.out.printf("\n Final Page Rank : \n");
		int max=0;
		int i=0;
		for (k = 0; k < totalNodes; k++) {
			System.out.printf(" Page Rank of " + k + " is :\t" + this.pagerank[k] + "\n");
			if(this.pagerank[max]<this.pagerank[k]){
				max=k;
				i=k;
			}
		}
		return i; //가장 중심에 있는 n번째 유저의 n값
	}	

}