package com.cutty.bravo.components.concurrent.collection;

import java.util.Queue;
import java.util.LinkedList;
public class TestQueue {
    public static void main(String[] args) {
        Queue<String> queue = new LinkedList<String>();
        queue.offer("Hello");
        queue.offer("World!");
        queue.offer("你好！");
        System.out.println(queue.size());
        String str;
        while((str=queue.poll())!=null){
            System.out.print(str);
        }
        System.out.println();
        System.out.println(queue.size());
    }
}