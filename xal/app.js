const fetch = require("node-fetch");


var URL="https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow";

fetch(URL)
.then((respuesta)=>{
  return respuesta.json()  
}).then((resp)=>{
 
    var con=0;
    var con2=0;

    for (a in resp.items){

        if (resp.items[a].is_answered== true){
            con++;
        }
        if (resp.items[a].is_answered== false){
            con2++;
        }
    }
    console.log("1 Obtener el número de respuestas contestadas y no contestadas");
    console.log("preguntas contestadas "+con)
    console.log("preguntas no contsetasdas "+con2)

})




fetch(URL)
.then((respuesta)=>{
  return respuesta.json()  
}).then((resp)=>{
 
    var mayor =resp.items[0].owner.reputation
    var posicionm ;
        for (a in resp.items){
           
            if (resp.items[a].owner.reputation> mayor){
    
                mayor=resp.items[a].owner.reputation;
                posicionm=a;
                
            }       
        }
        console.log("2 Obtener la respuesta con mayor owners")
        console.log(resp.items[0].owner)

})


fetch(URL)
.then((respuesta)=>{
  return respuesta.json()  
}).then((resp)=>{
 
var menor =resp.items[0].view_count
var posicionm ;
    for (a in resp.items){
       
        if (resp.items[a].view_count<= menor){

            menor= resp.items[a].view_count;
            posicionm=a;
            
        }       
    }
    console.log("3 Obtener la respuesta con menor número de vistas");
    console.log(resp.items[posicionm]);

})


fetch(URL)
.then((respuesta)=>{
  return respuesta.json()  
}).then((resp)=>{
    var conmenor;
    var conmayor;
var inicio =new Date (resp.items[0].creation_date)
    for (a in resp.items){
      var compara =new Date (resp.items[a].creation_date);
        if(inicio>compara){
            conmenor=a
        }
        if(inicio<compara){
            conmayor=a
        }
        
    }
    console.log("4. Obtener la respuesta más vieja y más actual ");

    console.log("respuesta mas vieja ");
    console.log(resp.items[conmenor] );
    console.log("respuesta mas actual" );
    console.log(resp.items[conmayor] );

})                



