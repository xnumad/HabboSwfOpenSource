package com.sulake.habbo.communication.messages.incoming.catalog
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NodeData 
    {
        private var _visible:Boolean;
        private var _icon:int;
        private var _pageId:int;
        private var _pageName:String;
        private var _localization:String;
        private var _children:Vector.<NodeData>;
        private var _offerIds:Vector.<int>;

        public function NodeData(k:IMessageDataWrapper)
        {
            this._visible = k.readBoolean();
            this._icon = k.readInteger();
            this._pageId = k.readInteger();
            this._pageName = k.readString();
            this._localization = k.readString();
            this._offerIds = new Vector.<int>(0);
			
			var _local_2:int = 0;
			var _local_3:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._offerIds.push(k.readInteger());
                _local_2++;
            }
            this._children = new Vector.<NodeData>(0);
            var _local_4:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_4)
            {
                this._children.push(new NodeData(k));
                _local_2++;
            }
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get icon():int
        {
            return this._icon;
        }

        public function get pageId():int
        {
            return this._pageId;
        }

        public function get pageName():String
        {
            return this._pageName;
        }

        public function get localization():String
        {
            return this._localization;
        }

        public function get children():Vector.<NodeData>
        {
            return this._children;
        }

        public function get pageOffers():Vector.<int>
        {
            return this._offerIds;
        }
    }
}
