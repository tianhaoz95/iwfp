/*eslint-disable block-scoped-var, id-length, no-control-regex, no-magic-numbers, no-prototype-builtins, no-redeclare, no-shadow, no-var, sort-vars*/
"use strict";

var $protobuf = require("protobufjs/minimal");

// Common aliases
var $Reader = $protobuf.Reader, $Writer = $protobuf.Writer, $util = $protobuf.util;

// Exported root namespace
var $root = $protobuf.roots["default"] || ($protobuf.roots["default"] = {});

$root.CreditCard = (function() {

    /**
     * Properties of a CreditCard.
     * @exports ICreditCard
     * @interface ICreditCard
     * @property {string|null} [id] CreditCard id
     * @property {string|null} [displayName] CreditCard displayName
     * @property {Array.<IPromotion>|null} [promotions] CreditCard promotions
     */

    /**
     * Constructs a new CreditCard.
     * @exports CreditCard
     * @classdesc Represents a CreditCard.
     * @implements ICreditCard
     * @constructor
     * @param {ICreditCard=} [properties] Properties to set
     */
    function CreditCard(properties) {
        this.promotions = [];
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCard id.
     * @member {string} id
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.id = "";

    /**
     * CreditCard displayName.
     * @member {string} displayName
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.displayName = "";

    /**
     * CreditCard promotions.
     * @member {Array.<IPromotion>} promotions
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.promotions = $util.emptyArray;

    /**
     * Creates a new CreditCard instance using the specified properties.
     * @function create
     * @memberof CreditCard
     * @static
     * @param {ICreditCard=} [properties] Properties to set
     * @returns {CreditCard} CreditCard instance
     */
    CreditCard.create = function create(properties) {
        return new CreditCard(properties);
    };

    /**
     * Encodes the specified CreditCard message. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @function encode
     * @memberof CreditCard
     * @static
     * @param {ICreditCard} message CreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCard.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.promotions != null && message.promotions.length)
            for (var i = 0; i < message.promotions.length; ++i)
                $root.Promotion.encode(message.promotions[i], writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified CreditCard message, length delimited. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCard
     * @static
     * @param {ICreditCard} message CreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCard.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCard message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCard} CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCard.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCard();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            case 3:
                if (!(message.promotions && message.promotions.length))
                    message.promotions = [];
                message.promotions.push($root.Promotion.decode(reader, reader.uint32()));
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCard message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCard} CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCard.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCard message.
     * @function verify
     * @memberof CreditCard
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCard.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        if (message.promotions != null && message.hasOwnProperty("promotions")) {
            if (!Array.isArray(message.promotions))
                return "promotions: array expected";
            for (var i = 0; i < message.promotions.length; ++i) {
                var error = $root.Promotion.verify(message.promotions[i]);
                if (error)
                    return "promotions." + error;
            }
        }
        return null;
    };

    /**
     * Creates a CreditCard message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCard
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCard} CreditCard
     */
    CreditCard.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCard)
            return object;
        var message = new $root.CreditCard();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.promotions) {
            if (!Array.isArray(object.promotions))
                throw TypeError(".CreditCard.promotions: array expected");
            message.promotions = [];
            for (var i = 0; i < object.promotions.length; ++i) {
                if (typeof object.promotions[i] !== "object")
                    throw TypeError(".CreditCard.promotions: object expected");
                message.promotions[i] = $root.Promotion.fromObject(object.promotions[i]);
            }
        }
        return message;
    };

    /**
     * Creates a plain object from a CreditCard message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCard
     * @static
     * @param {CreditCard} message CreditCard
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCard.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.arrays || options.defaults)
            object.promotions = [];
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.promotions && message.promotions.length) {
            object.promotions = [];
            for (var j = 0; j < message.promotions.length; ++j)
                object.promotions[j] = $root.Promotion.toObject(message.promotions[j], options);
        }
        return object;
    };

    /**
     * Converts this CreditCard to JSON.
     * @function toJSON
     * @memberof CreditCard
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCard.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCard;
})();

$root.Promotion = (function() {

    /**
     * Properties of a Promotion.
     * @exports IPromotion
     * @interface IPromotion
     * @property {string|null} [id] Promotion id
     * @property {string|null} [displayName] Promotion displayName
     * @property {string|null} [startDate] Promotion startDate
     * @property {string|null} [endDate] Promotion endDate
     * @property {string|null} [type] Promotion type
     * @property {string|null} [repeatPattern] Promotion repeatPattern
     * @property {number|null} [rate] Promotion rate
     * @property {IShoppingCategory|null} [category] Promotion category
     */

    /**
     * Constructs a new Promotion.
     * @exports Promotion
     * @classdesc Represents a Promotion.
     * @implements IPromotion
     * @constructor
     * @param {IPromotion=} [properties] Properties to set
     */
    function Promotion(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * Promotion id.
     * @member {string} id
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.id = "";

    /**
     * Promotion displayName.
     * @member {string} displayName
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.displayName = "";

    /**
     * Promotion startDate.
     * @member {string} startDate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.startDate = "";

    /**
     * Promotion endDate.
     * @member {string} endDate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.endDate = "";

    /**
     * Promotion type.
     * @member {string} type
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.type = "";

    /**
     * Promotion repeatPattern.
     * @member {string} repeatPattern
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.repeatPattern = "";

    /**
     * Promotion rate.
     * @member {number} rate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.rate = 0;

    /**
     * Promotion category.
     * @member {IShoppingCategory|null|undefined} category
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.category = null;

    /**
     * Creates a new Promotion instance using the specified properties.
     * @function create
     * @memberof Promotion
     * @static
     * @param {IPromotion=} [properties] Properties to set
     * @returns {Promotion} Promotion instance
     */
    Promotion.create = function create(properties) {
        return new Promotion(properties);
    };

    /**
     * Encodes the specified Promotion message. Does not implicitly {@link Promotion.verify|verify} messages.
     * @function encode
     * @memberof Promotion
     * @static
     * @param {IPromotion} message Promotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    Promotion.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.startDate != null && Object.hasOwnProperty.call(message, "startDate"))
            writer.uint32(/* id 3, wireType 2 =*/26).string(message.startDate);
        if (message.endDate != null && Object.hasOwnProperty.call(message, "endDate"))
            writer.uint32(/* id 4, wireType 2 =*/34).string(message.endDate);
        if (message.type != null && Object.hasOwnProperty.call(message, "type"))
            writer.uint32(/* id 5, wireType 2 =*/42).string(message.type);
        if (message.repeatPattern != null && Object.hasOwnProperty.call(message, "repeatPattern"))
            writer.uint32(/* id 6, wireType 2 =*/50).string(message.repeatPattern);
        if (message.rate != null && Object.hasOwnProperty.call(message, "rate"))
            writer.uint32(/* id 7, wireType 5 =*/61).float(message.rate);
        if (message.category != null && Object.hasOwnProperty.call(message, "category"))
            $root.ShoppingCategory.encode(message.category, writer.uint32(/* id 8, wireType 2 =*/66).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified Promotion message, length delimited. Does not implicitly {@link Promotion.verify|verify} messages.
     * @function encodeDelimited
     * @memberof Promotion
     * @static
     * @param {IPromotion} message Promotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    Promotion.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a Promotion message from the specified reader or buffer.
     * @function decode
     * @memberof Promotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {Promotion} Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    Promotion.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.Promotion();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            case 3:
                message.startDate = reader.string();
                break;
            case 4:
                message.endDate = reader.string();
                break;
            case 5:
                message.type = reader.string();
                break;
            case 6:
                message.repeatPattern = reader.string();
                break;
            case 7:
                message.rate = reader.float();
                break;
            case 8:
                message.category = $root.ShoppingCategory.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a Promotion message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof Promotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {Promotion} Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    Promotion.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a Promotion message.
     * @function verify
     * @memberof Promotion
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    Promotion.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        if (message.startDate != null && message.hasOwnProperty("startDate"))
            if (!$util.isString(message.startDate))
                return "startDate: string expected";
        if (message.endDate != null && message.hasOwnProperty("endDate"))
            if (!$util.isString(message.endDate))
                return "endDate: string expected";
        if (message.type != null && message.hasOwnProperty("type"))
            if (!$util.isString(message.type))
                return "type: string expected";
        if (message.repeatPattern != null && message.hasOwnProperty("repeatPattern"))
            if (!$util.isString(message.repeatPattern))
                return "repeatPattern: string expected";
        if (message.rate != null && message.hasOwnProperty("rate"))
            if (typeof message.rate !== "number")
                return "rate: number expected";
        if (message.category != null && message.hasOwnProperty("category")) {
            var error = $root.ShoppingCategory.verify(message.category);
            if (error)
                return "category." + error;
        }
        return null;
    };

    /**
     * Creates a Promotion message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof Promotion
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {Promotion} Promotion
     */
    Promotion.fromObject = function fromObject(object) {
        if (object instanceof $root.Promotion)
            return object;
        var message = new $root.Promotion();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.startDate != null)
            message.startDate = String(object.startDate);
        if (object.endDate != null)
            message.endDate = String(object.endDate);
        if (object.type != null)
            message.type = String(object.type);
        if (object.repeatPattern != null)
            message.repeatPattern = String(object.repeatPattern);
        if (object.rate != null)
            message.rate = Number(object.rate);
        if (object.category != null) {
            if (typeof object.category !== "object")
                throw TypeError(".Promotion.category: object expected");
            message.category = $root.ShoppingCategory.fromObject(object.category);
        }
        return message;
    };

    /**
     * Creates a plain object from a Promotion message. Also converts values to other types if specified.
     * @function toObject
     * @memberof Promotion
     * @static
     * @param {Promotion} message Promotion
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    Promotion.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
            object.startDate = "";
            object.endDate = "";
            object.type = "";
            object.repeatPattern = "";
            object.rate = 0;
            object.category = null;
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.startDate != null && message.hasOwnProperty("startDate"))
            object.startDate = message.startDate;
        if (message.endDate != null && message.hasOwnProperty("endDate"))
            object.endDate = message.endDate;
        if (message.type != null && message.hasOwnProperty("type"))
            object.type = message.type;
        if (message.repeatPattern != null && message.hasOwnProperty("repeatPattern"))
            object.repeatPattern = message.repeatPattern;
        if (message.rate != null && message.hasOwnProperty("rate"))
            object.rate = options.json && !isFinite(message.rate) ? String(message.rate) : message.rate;
        if (message.category != null && message.hasOwnProperty("category"))
            object.category = $root.ShoppingCategory.toObject(message.category, options);
        return object;
    };

    /**
     * Converts this Promotion to JSON.
     * @function toJSON
     * @memberof Promotion
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    Promotion.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return Promotion;
})();

$root.ShoppingCategory = (function() {

    /**
     * Properties of a ShoppingCategory.
     * @exports IShoppingCategory
     * @interface IShoppingCategory
     * @property {string|null} [id] ShoppingCategory id
     * @property {string|null} [displayName] ShoppingCategory displayName
     */

    /**
     * Constructs a new ShoppingCategory.
     * @exports ShoppingCategory
     * @classdesc Represents a ShoppingCategory.
     * @implements IShoppingCategory
     * @constructor
     * @param {IShoppingCategory=} [properties] Properties to set
     */
    function ShoppingCategory(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * ShoppingCategory id.
     * @member {string} id
     * @memberof ShoppingCategory
     * @instance
     */
    ShoppingCategory.prototype.id = "";

    /**
     * ShoppingCategory displayName.
     * @member {string} displayName
     * @memberof ShoppingCategory
     * @instance
     */
    ShoppingCategory.prototype.displayName = "";

    /**
     * Creates a new ShoppingCategory instance using the specified properties.
     * @function create
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory=} [properties] Properties to set
     * @returns {ShoppingCategory} ShoppingCategory instance
     */
    ShoppingCategory.create = function create(properties) {
        return new ShoppingCategory(properties);
    };

    /**
     * Encodes the specified ShoppingCategory message. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @function encode
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory} message ShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ShoppingCategory.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        return writer;
    };

    /**
     * Encodes the specified ShoppingCategory message, length delimited. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @function encodeDelimited
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory} message ShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ShoppingCategory.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a ShoppingCategory message from the specified reader or buffer.
     * @function decode
     * @memberof ShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {ShoppingCategory} ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ShoppingCategory.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.ShoppingCategory();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a ShoppingCategory message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof ShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {ShoppingCategory} ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ShoppingCategory.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a ShoppingCategory message.
     * @function verify
     * @memberof ShoppingCategory
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    ShoppingCategory.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        return null;
    };

    /**
     * Creates a ShoppingCategory message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof ShoppingCategory
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {ShoppingCategory} ShoppingCategory
     */
    ShoppingCategory.fromObject = function fromObject(object) {
        if (object instanceof $root.ShoppingCategory)
            return object;
        var message = new $root.ShoppingCategory();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        return message;
    };

    /**
     * Creates a plain object from a ShoppingCategory message. Also converts values to other types if specified.
     * @function toObject
     * @memberof ShoppingCategory
     * @static
     * @param {ShoppingCategory} message ShoppingCategory
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    ShoppingCategory.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        return object;
    };

    /**
     * Converts this ShoppingCategory to JSON.
     * @function toJSON
     * @memberof ShoppingCategory
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    ShoppingCategory.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return ShoppingCategory;
})();

module.exports = $root;
