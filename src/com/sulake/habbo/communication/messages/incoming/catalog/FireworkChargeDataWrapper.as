package com.sulake.habbo.communication.messages.incoming.catalog 
{
	import com.sulake.core.runtime.IDisposable;
	/**
	 * ...
	 * @author 
	 */
	public class FireworkChargeDataWrapper implements IDisposable
	{
		
        private var _fireworksChargeData:FireworkChargeData;
        private var _disposed:Boolean = false;
		
		public function FireworkChargeDataWrapper(fireworksChargeData:FireworkChargeData) 
		{
			this._fireworksChargeData = fireworksChargeData;
		}
		
		
		/* INTERFACE com.sulake.core.runtime.IDisposable */
		
		public function dispose():void 
		{
			if (!this._disposed)
			{
				this._fireworksChargeData = null;
				this._disposed = true;
			}
		}
		
		public function get disposed():Boolean 
		{
			return _disposed;
		}
		
		public function get _SafeStr_5394():int
        {
            return 0;
        }

        public function get _SafeStr_5944():int
        {
            return (this._fireworksChargeData != null) ? this._fireworksChargeData._SafeStr_5944 : 0;
        }

        public function get _SafeStr_5945():int
        {
            return (this._fireworksChargeData != null) ? this._fireworksChargeData._SafeStr_5945 : 0;
        }

        public function get _SafeStr_5946():int
        {
            return (this._fireworksChargeData != null) ? this._fireworksChargeData._SafeStr_5946 : 0;
        }
	}

}
