using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace YAF.Classes.Data.pgsql.Fts
{
    public class Search
    {
        public DataTable SearchIt()
        {
            string key;
            string name = string.Empty;
            string str = string.Empty;

            Hashtable hashtable = new Hashtable();
            key = "ru";
            name = "russian";
            hashtable.Add(key, name);
            key = "en";
            name = "english";
            hashtable.Add(key, name);
            key = "sp";
            name = "spanish";
            hashtable.Add(key, name);
           // SELECT dictinitoption FROM pg_catalog.pg_ts_dict where dictname like 'russian%'
           // SELECT * FROM pg_catalog.pg_ts_dict
           // pg_ts_parser - exists
           //  http://www.sai.msu.su/~megera/postgres/fts/doc/fts-cfg.html
            /* SELECT message, messageid
FROM public.yaf_message
WHERE to_tsvector('russian', message) @@ to_tsquery('russian', 'живые'); 
SELECT * FROM pg_catalog.pg_class where relname ='pg_ts_dict_dictname_index'::regclass */
           return  new DataTable();
        }
    }
}
