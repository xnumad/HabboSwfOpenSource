//com.sulake.habbo.communication.messages.incoming.catalog.CatalogLocalizationData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogLocalizationData {

        private var _images:Array;
        private var _texts:Array;

        public function CatalogLocalizationData(k:IMessageDataWrapper);

        public function get images():Array;

        public function get texts():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

