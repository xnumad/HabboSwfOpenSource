package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.parts.PartDefinition;
    import com.sulake.habbo.avatar.structure.parts.ActivePartSet;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import com.sulake.habbo.avatar.structure.parts.*;

    public class PartSetsData implements IFigureSetData 
    {
        private var _parts:Dictionary;
        private var _activePartSets:Dictionary;

        public function PartSetsData()
        {
            this._parts = new Dictionary();
            this._activePartSets = new Dictionary();
        }

        public function parse(k:XML):Boolean
        {
            var _local_2:XML;
            var _local_3:XML;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.partSet[0].part)
            {
                this._parts[String(_local_2.@["set-type"])] = new PartDefinition(_local_2);
            }
            for each (_local_3 in k.activePartSet)
            {
                this._activePartSets[String(_local_3.@id)] = new ActivePartSet(_local_3);
            }
            return true;
        }

        public function _Str_1017(k:XML):Boolean
        {
            var _local_2:XML;
            var _local_3:XML;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.partSet[0].part)
            {
                this._parts[String(_local_2.@["set-type"])] = new PartDefinition(_local_2);
            }
            for each (_local_3 in k.activePartSet)
            {
                this._activePartSets[String(_local_3.@id)] = new ActivePartSet(_local_3);
            }
            return false;
        }

        public function getActiveParts(k:IActionDefinition):Array
        {
            var _local_2:ActivePartSet = this._activePartSets[k.activePartSet];
            if (_local_2 != null)
            {
                return _local_2.parts;
            }
            return [];
        }

        public function getPartDefinition(k:String):PartDefinition
        {
            return this._parts[k] as PartDefinition;
        }

        public function addPartDefinition(k:XML):PartDefinition
        {
            var _local_2:String = String(k.@["set-type"]);
            if (this._parts[_local_2] == null)
            {
                this._parts[_local_2] = new PartDefinition(k);
            }
            return this._parts[_local_2];
        }

        public function get parts():Dictionary
        {
            return this._parts;
        }

        public function get activePartSets():Dictionary
        {
            return this._activePartSets;
        }

        public function getActivePartSet(k:ActionDefinition):ActivePartSet
        {
            return this._activePartSets[k.activePartSet] as ActivePartSet;
        }
    }
}
