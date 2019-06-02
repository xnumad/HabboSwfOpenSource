//com.sulake.habbo.tablet.catalog.iap.IapUtils

package com.sulake.habbo.tablet.catalog.iap{
    import com.adobe.ane.productStore.Product;

    public class IapUtils {

        private static const DEFAULT_IAP_IMAGE:String;
        private static const DEFAULT_HC_CR_IMAGE:String;

        public function IapUtils();

        public static function parseLocalePrice(k:Product):String;

        public static function resolveProductImageUrl(k:Product):String;

        private static function resolveProductImageUrlFromElements(k:Array):String;

        public static function sortProducts(k:Product, _arg_2:Product):int;


    }
}//package com.sulake.habbo.tablet.catalog.iap

