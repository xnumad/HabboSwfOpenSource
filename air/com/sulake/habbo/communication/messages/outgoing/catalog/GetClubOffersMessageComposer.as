//com.sulake.habbo.communication.messages.outgoing.catalog.GetClubOffersMessageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetClubOffersMessageComposer implements IMessageComposer, IDisposable {

        private var _data:Array;

        public function GetClubOffersMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

