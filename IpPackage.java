package IpPackage;

private IpPackage(int o1,int o2,int o3,int o4) {
        this.octet1 = o1;
        this.octet2 = o2;
        this.octet3 = o3;
        this.octet4 = o4;
    }
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

    // Méthode static car méthode accessible en dehors de toute instanciation
    public static IpPackage getInstance(int o1, int o2,int o3,int o4) {
        try 
        {
            if (o1 < 0 || o1 > 255 || o2 < 0 || o2 > 255 || o3 < 0 || o3 > 255 || o4 < 0 || o4 > 255)
            {
                throw new Exception();
            }
        }
        catch (Exception e)
        {
            System.out.println("Valeur impossible \n");
            // return null;
        }
        
        System.out.println("o1 = " + o1);        
        System.out.println("o2 = " + o2);        
        System.out.println("o3 = " + o3);
        System.out.println("o4 = " + o4);                

        return new IpPackage(o1,o2,o3,o4);
    }
    
    public int getOctet1() {
        return this.octet1;
    }
    
    public int getOctet2() {
        return this.octet2;
    }
    
    public int getOctet3() {
        return this.octet3;
    }
    
    public int getOctet4() {
        return this.octet4;
    }
    
    public char getClasse() {
        char c = 'x';
        if (this.octet1 <= 126) {
            c = 'A';
        }
        if (this.octet1 >= 126 && this.octet1 <= 191) {
            c = 'B';
        }
        if (this.octet1 >= 192 && this.octet1 <= 223) {
            c = 'C';
        }
        return c;
    }
    
    public IpPackage adresseReseau() {
        final int octet1 = this.octet1;
        int n = 0;
        int octet2 = 0;
        final int n2 = 0;
        if (this.getClasse() == 'B') {
            n = this.octet2;
        }
        if (this.getClasse() == 'C') {
            n = this.octet2;
            octet2 = this.octet3;
        }
        return new IpPackage(octet1, n, octet2, n2);
    }
    
    public Boolean estMemeReseau(final IpPackage ipPackage) {
        return this.adresseReseau().octet1 == ipPackage.adresseReseau().octet1 && this.adresseReseau().octet2 == ipPackage.adresseReseau().octet2 && this.adresseReseau().octet3 == ipPackage.adresseReseau().octet3;
    }
        
        private int octet1;
        private int octet2;
        private int octet3;
        private int octet4;
}






