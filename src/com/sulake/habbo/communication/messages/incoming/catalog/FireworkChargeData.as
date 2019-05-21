package com.sulake.habbo.communication.messages.incoming.catalog 
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;
	/**
	 * ...
	 * @author 
	 */
	public class FireworkChargeData 
	{
		
		private var _SafeStr_7873:int;
        private var _sex:int;
        private var _SafeStr_6935:int;
        private var _SafeStr_6936:int;
        private var _SafeStr_6518:int;
        private var _SafeStr_7875:int;
		
		public function FireworkChargeData(buffer:IMessageDataWrapper) 
		{
			
			this._SafeStr_7873 = buffer.readInteger();
            this._sex = buffer.readInteger();
            this._SafeStr_6935 = buffer.readInteger();
            this._SafeStr_6936 = buffer.readInteger();
            this._SafeStr_6518 = buffer.readInteger();
            this._SafeStr_7875 = buffer.readInteger();
		}
		
        public function get stuffId():int
        {
            return this._SafeStr_7873;
        }

        public function get charges():int
        {
            return this._sex;
        }

        public function get _SafeStr_5946():int
        {
            return this._SafeStr_6935;
        }

        public function get _SafeStr_5944():int
        {
            return this._SafeStr_6936;
        }

        public function get _SafeStr_7876():int
        {
            return this._SafeStr_7875;
        }

        public function get _SafeStr_5945():int
        {
            return this._SafeStr_6518;
        }
	}

}
