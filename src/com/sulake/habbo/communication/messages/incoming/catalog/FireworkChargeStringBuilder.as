package com.sulake.habbo.communication.messages.incoming.catalog 
{
	import com.sulake.core.localization.ICoreLocalizationManager;
	import com.sulake.core.localization.ILocalization;
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.catalog.HabboCatalog;
	/**
	 * ...
	 * @author 
	 */
	public class FireworkChargeStringBuilder implements IDisposable
	{
		
        private var _balance:String;
        private var _cost:String;
		private var _disposed:Boolean;
		
		public function FireworkChargeStringBuilder(catalog:HabboCatalog, localization:ICoreLocalizationManager, dataWrapper:FireworkChargeDataWrapper)
        {
            if (((dataWrapper._SafeStr_5946 > 0) && (dataWrapper._SafeStr_5944 > 0)))
            {
                this.setWithKey(catalog, localization, dataWrapper, ("catalog.purchase.price.credits_and_activitypoints." + dataWrapper._SafeStr_5945));
            }
            else
            {
                if (dataWrapper._SafeStr_5946 > 0)
                {
                    this.setWithKey(catalog, localization, dataWrapper, "catalog.purchase.price.credits");
                }
                else
                {
                    if (dataWrapper._SafeStr_5944 > 0)
                    {
                        this.setWithKey(catalog, localization, dataWrapper, ("catalog.purchase.price.activitypoints." + dataWrapper._SafeStr_5945));
                    }
                    else
                    {
                        this.setWithKey(catalog, localization, dataWrapper, "catalog.purchase.price.none");
                    }
                }
            }
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            this._balance = null;
            this._cost = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function setWithKey(catalog:HabboCatalog, localization:ICoreLocalizationManager, dataWrapper:FireworkChargeDataWrapper, key:String):void
        {
            var _local_5:String = catalog.getPurse().credits.toString();
            var _local_6:String = ((dataWrapper._SafeStr_5945 == 0) ? "pixels" : "activitypoints");
            var _local_7:ILocalization = localization.getLocalizationRaw(key);
            if (_local_7)
            {
                localization.registerParameter(key, "credits", dataWrapper._SafeStr_5946.toString());
                localization.registerParameter(key, _local_6, dataWrapper._SafeStr_5944.toString());
                this._cost = _local_7.value;
                localization.registerParameter(key, "credits", _local_5);
                localization.registerParameter(key, _local_6, catalog.getPurse().getActivityPointsForType(dataWrapper._SafeStr_5945).toString());
                this._balance = _local_7.value;
            }
        }

        public function get balance():String
        {
            return this._balance;
        }

        public function get cost():String
        {
            return this._cost;
        }
		
	}

}
