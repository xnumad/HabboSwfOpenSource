package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogIndexMessageParser implements IMessageParser
    {
        private var _root:NodeData;
        private var _newAdditionsAvailable:Boolean;
        private var _catalogType:String;


        public function get root():NodeData
        {
            return this._root;
        }

        public function get newAdditionsAvailable():Boolean
        {
            return this._newAdditionsAvailable;
        }

        public function get catalogType():String
        {
            return this._catalogType;
        }

        public function flush():Boolean
        {
            this._root = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._root = new NodeData(k);
            this._newAdditionsAvailable = k.readBoolean();
            this._catalogType = k.readString();
            return true;
        }
    }
}
