using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    [Serializable]
    public class ShortMessageSending
    {
        public ShortMessageSending()
		{}
		#region Model		
		private string _uid;
		private string _key;		
		/// <summary>
		/// 
		/// </summary>
		public string Uid
		{
			set{ _uid=value;}
			get{return _uid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Key
		{
			set{ _key=value;}
			get{return _key;}
		}
		#endregion Model
    }
}
