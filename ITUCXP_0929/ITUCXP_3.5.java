public void hf3 (String fnevbe, String fnevki) {
  String sor; 
  String[] szavak;  
  String[] k1 = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };  
  String[] k2 = { " egy ", " kettő ", " három ", " négy ", " öt ", " hat ", " hét ", 
       "nyolc ", "kilenc ", " nulla" }; 
  int sorid = 0 ; 
  try {
     BufferedWriter bw = new BufferedWriter(new FileWriter(fnevki));
     BufferedReader br = new BufferedReader(new FileReader(fnevbe)); 
     while ( (sor =   br.readLine()) != null) {
       for (int i=0; i<10; i++){
         sor =  sor.replace(k1[i],k2[i]);
       }
       bw.write(sor);
       bw.newLine();
     }
     br.close();
     bw.close();
     System.out.println("Ok");
  } catch (Exception ee){
     ee.printStackTrace();
  }
}
    
