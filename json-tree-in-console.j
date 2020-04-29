let obj={"a":"aaa","b":"bbb","c":{"c1":{"c11":"ccc","c12":"cc\ncc"},"d":["d1","d2","d3",{"×":"+×÷=%"},["1","2","3"],{},[ ]]},"f":["12","÷=","€£"]};
console.log(obj.a+":"+obj.b);
console.log(obj.constructor.name);
console.log(obj.c.d.constructor.name);
console.log(obj.c.d.length);
console.log(obj.a.constructor.name);

let resStr={};
resStr.str="";
let ident="";
let level="      ";
function tree(obj,str,ident)
{
    if(obj.constructor.name=="Array")
    {
        array(obj,str,ident);
        return;
     }
    if(obj.constructor.name=="Object")
    {
        object(obj,str,ident);
    }
}
function object(obj,str,ident)
{
    str.str+=ident+"{";
    //ident+=level;
    let first=true;
    for(let prop in obj)
    {
        if(first)
        {
            str.str+="\n";
            first=false;
        }
        else
        {
            str.str+=",\n";
        }
        
        str.str+=ident+level+"\""+prop+"\":";
        if(obj[prop].constructor.name=="Object")
        {
            str.str+="\n";
            object(obj[prop],str,ident+level+level);
        }
        if(obj[prop].constructor.name=="Array")
        {
            str.str+="\n";
            array(obj[prop],str,ident+level+level);
        }
        if(obj[prop].constructor.name=="String")
        {
            str.str+="\""+obj[prop]+"\"";
        }
    }
    if(!first) str.str+="\n"+ident;
    str.str+="}";
}
function array(obj,str,ident)
{
    str.str+=ident+"[";
    //ident+=level;
    let first=true;
    for(let prop of obj)
    {
        if(first)
        {
            str.str+="\n";
            first=false;
        }
        else
        {
            str.str+=",\n";
        }
        //str.str+=ident;
        if(prop.constructor.name=="Object")
        {
            //str.str+="\n";
            object(prop,str,ident+level);
        }
        if(prop.constructor.name=="Array")
        {
            //str.str+="\n";
            array(prop,str,ident+level);
        }
        if(prop.constructor.name=="String")
        {
            str.str+=ident+level+"\""+prop+"\"";
        }
    }
    if(!first) str.str+="\n"+ident;
    str.str+="]";
}
tree(obj,resStr,"");
console.log("-------------------------");
console.log(resStr.str);












////

