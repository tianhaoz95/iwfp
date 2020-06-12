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
     * @property {string|null} [officialUrl] CreditCard officialUrl
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
     * CreditCard officialUrl.
     * @member {string} officialUrl
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.officialUrl = "";

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
        if (message.officialUrl != null && Object.hasOwnProperty.call(message, "officialUrl"))
            writer.uint32(/* id 4, wireType 2 =*/34).string(message.officialUrl);
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
            case 4:
                message.officialUrl = reader.string();
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
        if (message.officialUrl != null && message.hasOwnProperty("officialUrl"))
            if (!$util.isString(message.officialUrl))
                return "officialUrl: string expected";
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
        if (object.officialUrl != null)
            message.officialUrl = String(object.officialUrl);
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
            object.officialUrl = "";
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
        if (message.officialUrl != null && message.hasOwnProperty("officialUrl"))
            object.officialUrl = message.officialUrl;
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

$root.CreditCardCreationRequest = (function() {

    /**
     * Properties of a CreditCardCreationRequest.
     * @exports ICreditCardCreationRequest
     * @interface ICreditCardCreationRequest
     * @property {boolean|null} [valid] CreditCardCreationRequest valid
     * @property {ICreditCard|null} [cardData] CreditCardCreationRequest cardData
     */

    /**
     * Constructs a new CreditCardCreationRequest.
     * @exports CreditCardCreationRequest
     * @classdesc Represents a CreditCardCreationRequest.
     * @implements ICreditCardCreationRequest
     * @constructor
     * @param {ICreditCardCreationRequest=} [properties] Properties to set
     */
    function CreditCardCreationRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardCreationRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardCreationRequest
     * @instance
     */
    CreditCardCreationRequest.prototype.valid = false;

    /**
     * CreditCardCreationRequest cardData.
     * @member {ICreditCard|null|undefined} cardData
     * @memberof CreditCardCreationRequest
     * @instance
     */
    CreditCardCreationRequest.prototype.cardData = null;

    /**
     * Creates a new CreditCardCreationRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest=} [properties] Properties to set
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest instance
     */
    CreditCardCreationRequest.create = function create(properties) {
        return new CreditCardCreationRequest(properties);
    };

    /**
     * Encodes the specified CreditCardCreationRequest message. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest} message CreditCardCreationRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardCreationRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.cardData != null && Object.hasOwnProperty.call(message, "cardData"))
            $root.CreditCard.encode(message.cardData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified CreditCardCreationRequest message, length delimited. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest} message CreditCardCreationRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardCreationRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardCreationRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardCreationRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardCreationRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardCreationRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.cardData = $root.CreditCard.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardCreationRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardCreationRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardCreationRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardCreationRequest message.
     * @function verify
     * @memberof CreditCardCreationRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardCreationRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.cardData != null && message.hasOwnProperty("cardData")) {
            var error = $root.CreditCard.verify(message.cardData);
            if (error)
                return "cardData." + error;
        }
        return null;
    };

    /**
     * Creates a CreditCardCreationRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardCreationRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     */
    CreditCardCreationRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardCreationRequest)
            return object;
        var message = new $root.CreditCardCreationRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.cardData != null) {
            if (typeof object.cardData !== "object")
                throw TypeError(".CreditCardCreationRequest.cardData: object expected");
            message.cardData = $root.CreditCard.fromObject(object.cardData);
        }
        return message;
    };

    /**
     * Creates a plain object from a CreditCardCreationRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardCreationRequest
     * @static
     * @param {CreditCardCreationRequest} message CreditCardCreationRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardCreationRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.cardData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.cardData != null && message.hasOwnProperty("cardData"))
            object.cardData = $root.CreditCard.toObject(message.cardData, options);
        return object;
    };

    /**
     * Converts this CreditCardCreationRequest to JSON.
     * @function toJSON
     * @memberof CreditCardCreationRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardCreationRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardCreationRequest;
})();

$root.CreditCardUpdateRequest = (function() {

    /**
     * Properties of a CreditCardUpdateRequest.
     * @exports ICreditCardUpdateRequest
     * @interface ICreditCardUpdateRequest
     * @property {boolean|null} [valid] CreditCardUpdateRequest valid
     * @property {ICreditCard|null} [updatedCardData] CreditCardUpdateRequest updatedCardData
     */

    /**
     * Constructs a new CreditCardUpdateRequest.
     * @exports CreditCardUpdateRequest
     * @classdesc Represents a CreditCardUpdateRequest.
     * @implements ICreditCardUpdateRequest
     * @constructor
     * @param {ICreditCardUpdateRequest=} [properties] Properties to set
     */
    function CreditCardUpdateRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardUpdateRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardUpdateRequest
     * @instance
     */
    CreditCardUpdateRequest.prototype.valid = false;

    /**
     * CreditCardUpdateRequest updatedCardData.
     * @member {ICreditCard|null|undefined} updatedCardData
     * @memberof CreditCardUpdateRequest
     * @instance
     */
    CreditCardUpdateRequest.prototype.updatedCardData = null;

    /**
     * Creates a new CreditCardUpdateRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest=} [properties] Properties to set
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest instance
     */
    CreditCardUpdateRequest.create = function create(properties) {
        return new CreditCardUpdateRequest(properties);
    };

    /**
     * Encodes the specified CreditCardUpdateRequest message. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest} message CreditCardUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardUpdateRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.updatedCardData != null && Object.hasOwnProperty.call(message, "updatedCardData"))
            $root.CreditCard.encode(message.updatedCardData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified CreditCardUpdateRequest message, length delimited. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest} message CreditCardUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardUpdateRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardUpdateRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardUpdateRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardUpdateRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.updatedCardData = $root.CreditCard.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardUpdateRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardUpdateRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardUpdateRequest message.
     * @function verify
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardUpdateRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.updatedCardData != null && message.hasOwnProperty("updatedCardData")) {
            var error = $root.CreditCard.verify(message.updatedCardData);
            if (error)
                return "updatedCardData." + error;
        }
        return null;
    };

    /**
     * Creates a CreditCardUpdateRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     */
    CreditCardUpdateRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardUpdateRequest)
            return object;
        var message = new $root.CreditCardUpdateRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.updatedCardData != null) {
            if (typeof object.updatedCardData !== "object")
                throw TypeError(".CreditCardUpdateRequest.updatedCardData: object expected");
            message.updatedCardData = $root.CreditCard.fromObject(object.updatedCardData);
        }
        return message;
    };

    /**
     * Creates a plain object from a CreditCardUpdateRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {CreditCardUpdateRequest} message CreditCardUpdateRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardUpdateRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.updatedCardData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.updatedCardData != null && message.hasOwnProperty("updatedCardData"))
            object.updatedCardData = $root.CreditCard.toObject(message.updatedCardData, options);
        return object;
    };

    /**
     * Converts this CreditCardUpdateRequest to JSON.
     * @function toJSON
     * @memberof CreditCardUpdateRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardUpdateRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardUpdateRequest;
})();

$root.CreditCardRemovalRequest = (function() {

    /**
     * Properties of a CreditCardRemovalRequest.
     * @exports ICreditCardRemovalRequest
     * @interface ICreditCardRemovalRequest
     * @property {boolean|null} [valid] CreditCardRemovalRequest valid
     * @property {string|null} [cardId] CreditCardRemovalRequest cardId
     */

    /**
     * Constructs a new CreditCardRemovalRequest.
     * @exports CreditCardRemovalRequest
     * @classdesc Represents a CreditCardRemovalRequest.
     * @implements ICreditCardRemovalRequest
     * @constructor
     * @param {ICreditCardRemovalRequest=} [properties] Properties to set
     */
    function CreditCardRemovalRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardRemovalRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardRemovalRequest
     * @instance
     */
    CreditCardRemovalRequest.prototype.valid = false;

    /**
     * CreditCardRemovalRequest cardId.
     * @member {string} cardId
     * @memberof CreditCardRemovalRequest
     * @instance
     */
    CreditCardRemovalRequest.prototype.cardId = "";

    /**
     * Creates a new CreditCardRemovalRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest=} [properties] Properties to set
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest instance
     */
    CreditCardRemovalRequest.create = function create(properties) {
        return new CreditCardRemovalRequest(properties);
    };

    /**
     * Encodes the specified CreditCardRemovalRequest message. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest} message CreditCardRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardRemovalRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.cardId != null && Object.hasOwnProperty.call(message, "cardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.cardId);
        return writer;
    };

    /**
     * Encodes the specified CreditCardRemovalRequest message, length delimited. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest} message CreditCardRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardRemovalRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardRemovalRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardRemovalRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardRemovalRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.cardId = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardRemovalRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardRemovalRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardRemovalRequest message.
     * @function verify
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardRemovalRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            if (!$util.isString(message.cardId))
                return "cardId: string expected";
        return null;
    };

    /**
     * Creates a CreditCardRemovalRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     */
    CreditCardRemovalRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardRemovalRequest)
            return object;
        var message = new $root.CreditCardRemovalRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.cardId != null)
            message.cardId = String(object.cardId);
        return message;
    };

    /**
     * Creates a plain object from a CreditCardRemovalRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {CreditCardRemovalRequest} message CreditCardRemovalRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardRemovalRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.cardId = "";
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            object.cardId = message.cardId;
        return object;
    };

    /**
     * Converts this CreditCardRemovalRequest to JSON.
     * @function toJSON
     * @memberof CreditCardRemovalRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardRemovalRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardRemovalRequest;
})();

$root.PromotionAdditionRequest = (function() {

    /**
     * Properties of a PromotionAdditionRequest.
     * @exports IPromotionAdditionRequest
     * @interface IPromotionAdditionRequest
     * @property {boolean|null} [valid] PromotionAdditionRequest valid
     * @property {string|null} [targetCardId] PromotionAdditionRequest targetCardId
     * @property {IPromotion|null} [promotionData] PromotionAdditionRequest promotionData
     */

    /**
     * Constructs a new PromotionAdditionRequest.
     * @exports PromotionAdditionRequest
     * @classdesc Represents a PromotionAdditionRequest.
     * @implements IPromotionAdditionRequest
     * @constructor
     * @param {IPromotionAdditionRequest=} [properties] Properties to set
     */
    function PromotionAdditionRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionAdditionRequest valid.
     * @member {boolean} valid
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.valid = false;

    /**
     * PromotionAdditionRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.targetCardId = "";

    /**
     * PromotionAdditionRequest promotionData.
     * @member {IPromotion|null|undefined} promotionData
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.promotionData = null;

    /**
     * Creates a new PromotionAdditionRequest instance using the specified properties.
     * @function create
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest=} [properties] Properties to set
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest instance
     */
    PromotionAdditionRequest.create = function create(properties) {
        return new PromotionAdditionRequest(properties);
    };

    /**
     * Encodes the specified PromotionAdditionRequest message. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest} message PromotionAdditionRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionAdditionRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.targetCardId);
        if (message.promotionData != null && Object.hasOwnProperty.call(message, "promotionData"))
            $root.Promotion.encode(message.promotionData, writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified PromotionAdditionRequest message, length delimited. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest} message PromotionAdditionRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionAdditionRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionAdditionRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionAdditionRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionAdditionRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionAdditionRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.targetCardId = reader.string();
                break;
            case 3:
                message.promotionData = $root.Promotion.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionAdditionRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionAdditionRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionAdditionRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionAdditionRequest message.
     * @function verify
     * @memberof PromotionAdditionRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionAdditionRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.promotionData != null && message.hasOwnProperty("promotionData")) {
            var error = $root.Promotion.verify(message.promotionData);
            if (error)
                return "promotionData." + error;
        }
        return null;
    };

    /**
     * Creates a PromotionAdditionRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionAdditionRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     */
    PromotionAdditionRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionAdditionRequest)
            return object;
        var message = new $root.PromotionAdditionRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.promotionData != null) {
            if (typeof object.promotionData !== "object")
                throw TypeError(".PromotionAdditionRequest.promotionData: object expected");
            message.promotionData = $root.Promotion.fromObject(object.promotionData);
        }
        return message;
    };

    /**
     * Creates a plain object from a PromotionAdditionRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionAdditionRequest
     * @static
     * @param {PromotionAdditionRequest} message PromotionAdditionRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionAdditionRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.targetCardId = "";
            object.promotionData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.promotionData != null && message.hasOwnProperty("promotionData"))
            object.promotionData = $root.Promotion.toObject(message.promotionData, options);
        return object;
    };

    /**
     * Converts this PromotionAdditionRequest to JSON.
     * @function toJSON
     * @memberof PromotionAdditionRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionAdditionRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionAdditionRequest;
})();

$root.PromotionRemovalRequest = (function() {

    /**
     * Properties of a PromotionRemovalRequest.
     * @exports IPromotionRemovalRequest
     * @interface IPromotionRemovalRequest
     * @property {boolean|null} [valid] PromotionRemovalRequest valid
     * @property {string|null} [targetCardId] PromotionRemovalRequest targetCardId
     * @property {string|null} [targetPromotionId] PromotionRemovalRequest targetPromotionId
     */

    /**
     * Constructs a new PromotionRemovalRequest.
     * @exports PromotionRemovalRequest
     * @classdesc Represents a PromotionRemovalRequest.
     * @implements IPromotionRemovalRequest
     * @constructor
     * @param {IPromotionRemovalRequest=} [properties] Properties to set
     */
    function PromotionRemovalRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionRemovalRequest valid.
     * @member {boolean} valid
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.valid = false;

    /**
     * PromotionRemovalRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.targetCardId = "";

    /**
     * PromotionRemovalRequest targetPromotionId.
     * @member {string} targetPromotionId
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.targetPromotionId = "";

    /**
     * Creates a new PromotionRemovalRequest instance using the specified properties.
     * @function create
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest=} [properties] Properties to set
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest instance
     */
    PromotionRemovalRequest.create = function create(properties) {
        return new PromotionRemovalRequest(properties);
    };

    /**
     * Encodes the specified PromotionRemovalRequest message. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest} message PromotionRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionRemovalRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.targetCardId);
        if (message.targetPromotionId != null && Object.hasOwnProperty.call(message, "targetPromotionId"))
            writer.uint32(/* id 3, wireType 2 =*/26).string(message.targetPromotionId);
        return writer;
    };

    /**
     * Encodes the specified PromotionRemovalRequest message, length delimited. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest} message PromotionRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionRemovalRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionRemovalRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionRemovalRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionRemovalRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.targetCardId = reader.string();
                break;
            case 3:
                message.targetPromotionId = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionRemovalRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionRemovalRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionRemovalRequest message.
     * @function verify
     * @memberof PromotionRemovalRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionRemovalRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.targetPromotionId != null && message.hasOwnProperty("targetPromotionId"))
            if (!$util.isString(message.targetPromotionId))
                return "targetPromotionId: string expected";
        return null;
    };

    /**
     * Creates a PromotionRemovalRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionRemovalRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     */
    PromotionRemovalRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionRemovalRequest)
            return object;
        var message = new $root.PromotionRemovalRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.targetPromotionId != null)
            message.targetPromotionId = String(object.targetPromotionId);
        return message;
    };

    /**
     * Creates a plain object from a PromotionRemovalRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionRemovalRequest
     * @static
     * @param {PromotionRemovalRequest} message PromotionRemovalRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionRemovalRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.targetCardId = "";
            object.targetPromotionId = "";
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.targetPromotionId != null && message.hasOwnProperty("targetPromotionId"))
            object.targetPromotionId = message.targetPromotionId;
        return object;
    };

    /**
     * Converts this PromotionRemovalRequest to JSON.
     * @function toJSON
     * @memberof PromotionRemovalRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionRemovalRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionRemovalRequest;
})();

$root.PromotionUpdateRequest = (function() {

    /**
     * Properties of a PromotionUpdateRequest.
     * @exports IPromotionUpdateRequest
     * @interface IPromotionUpdateRequest
     * @property {string|null} [targetCardId] PromotionUpdateRequest targetCardId
     * @property {IPromotion|null} [updatedPromotionData] PromotionUpdateRequest updatedPromotionData
     */

    /**
     * Constructs a new PromotionUpdateRequest.
     * @exports PromotionUpdateRequest
     * @classdesc Represents a PromotionUpdateRequest.
     * @implements IPromotionUpdateRequest
     * @constructor
     * @param {IPromotionUpdateRequest=} [properties] Properties to set
     */
    function PromotionUpdateRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionUpdateRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionUpdateRequest
     * @instance
     */
    PromotionUpdateRequest.prototype.targetCardId = "";

    /**
     * PromotionUpdateRequest updatedPromotionData.
     * @member {IPromotion|null|undefined} updatedPromotionData
     * @memberof PromotionUpdateRequest
     * @instance
     */
    PromotionUpdateRequest.prototype.updatedPromotionData = null;

    /**
     * Creates a new PromotionUpdateRequest instance using the specified properties.
     * @function create
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest=} [properties] Properties to set
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest instance
     */
    PromotionUpdateRequest.create = function create(properties) {
        return new PromotionUpdateRequest(properties);
    };

    /**
     * Encodes the specified PromotionUpdateRequest message. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest} message PromotionUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionUpdateRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.targetCardId);
        if (message.updatedPromotionData != null && Object.hasOwnProperty.call(message, "updatedPromotionData"))
            $root.Promotion.encode(message.updatedPromotionData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified PromotionUpdateRequest message, length delimited. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest} message PromotionUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionUpdateRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionUpdateRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionUpdateRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionUpdateRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.targetCardId = reader.string();
                break;
            case 2:
                message.updatedPromotionData = $root.Promotion.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionUpdateRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionUpdateRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionUpdateRequest message.
     * @function verify
     * @memberof PromotionUpdateRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionUpdateRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.updatedPromotionData != null && message.hasOwnProperty("updatedPromotionData")) {
            var error = $root.Promotion.verify(message.updatedPromotionData);
            if (error)
                return "updatedPromotionData." + error;
        }
        return null;
    };

    /**
     * Creates a PromotionUpdateRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionUpdateRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     */
    PromotionUpdateRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionUpdateRequest)
            return object;
        var message = new $root.PromotionUpdateRequest();
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.updatedPromotionData != null) {
            if (typeof object.updatedPromotionData !== "object")
                throw TypeError(".PromotionUpdateRequest.updatedPromotionData: object expected");
            message.updatedPromotionData = $root.Promotion.fromObject(object.updatedPromotionData);
        }
        return message;
    };

    /**
     * Creates a plain object from a PromotionUpdateRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionUpdateRequest
     * @static
     * @param {PromotionUpdateRequest} message PromotionUpdateRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionUpdateRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.targetCardId = "";
            object.updatedPromotionData = null;
        }
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.updatedPromotionData != null && message.hasOwnProperty("updatedPromotionData"))
            object.updatedPromotionData = $root.Promotion.toObject(message.updatedPromotionData, options);
        return object;
    };

    /**
     * Converts this PromotionUpdateRequest to JSON.
     * @function toJSON
     * @memberof PromotionUpdateRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionUpdateRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionUpdateRequest;
})();

$root.GetCreditCardResponse = (function() {

    /**
     * Properties of a GetCreditCardResponse.
     * @exports IGetCreditCardResponse
     * @interface IGetCreditCardResponse
     * @property {Array.<ICreditCard>|null} [cards] GetCreditCardResponse cards
     */

    /**
     * Constructs a new GetCreditCardResponse.
     * @exports GetCreditCardResponse
     * @classdesc Represents a GetCreditCardResponse.
     * @implements IGetCreditCardResponse
     * @constructor
     * @param {IGetCreditCardResponse=} [properties] Properties to set
     */
    function GetCreditCardResponse(properties) {
        this.cards = [];
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * GetCreditCardResponse cards.
     * @member {Array.<ICreditCard>} cards
     * @memberof GetCreditCardResponse
     * @instance
     */
    GetCreditCardResponse.prototype.cards = $util.emptyArray;

    /**
     * Creates a new GetCreditCardResponse instance using the specified properties.
     * @function create
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse=} [properties] Properties to set
     * @returns {GetCreditCardResponse} GetCreditCardResponse instance
     */
    GetCreditCardResponse.create = function create(properties) {
        return new GetCreditCardResponse(properties);
    };

    /**
     * Encodes the specified GetCreditCardResponse message. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
     * @function encode
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse} message GetCreditCardResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GetCreditCardResponse.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.cards != null && message.cards.length)
            for (var i = 0; i < message.cards.length; ++i)
                $root.CreditCard.encode(message.cards[i], writer.uint32(/* id 1, wireType 2 =*/10).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified GetCreditCardResponse message, length delimited. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
     * @function encodeDelimited
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse} message GetCreditCardResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GetCreditCardResponse.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a GetCreditCardResponse message from the specified reader or buffer.
     * @function decode
     * @memberof GetCreditCardResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GetCreditCardResponse.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.GetCreditCardResponse();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                if (!(message.cards && message.cards.length))
                    message.cards = [];
                message.cards.push($root.CreditCard.decode(reader, reader.uint32()));
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a GetCreditCardResponse message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof GetCreditCardResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GetCreditCardResponse.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a GetCreditCardResponse message.
     * @function verify
     * @memberof GetCreditCardResponse
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    GetCreditCardResponse.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.cards != null && message.hasOwnProperty("cards")) {
            if (!Array.isArray(message.cards))
                return "cards: array expected";
            for (var i = 0; i < message.cards.length; ++i) {
                var error = $root.CreditCard.verify(message.cards[i]);
                if (error)
                    return "cards." + error;
            }
        }
        return null;
    };

    /**
     * Creates a GetCreditCardResponse message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof GetCreditCardResponse
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     */
    GetCreditCardResponse.fromObject = function fromObject(object) {
        if (object instanceof $root.GetCreditCardResponse)
            return object;
        var message = new $root.GetCreditCardResponse();
        if (object.cards) {
            if (!Array.isArray(object.cards))
                throw TypeError(".GetCreditCardResponse.cards: array expected");
            message.cards = [];
            for (var i = 0; i < object.cards.length; ++i) {
                if (typeof object.cards[i] !== "object")
                    throw TypeError(".GetCreditCardResponse.cards: object expected");
                message.cards[i] = $root.CreditCard.fromObject(object.cards[i]);
            }
        }
        return message;
    };

    /**
     * Creates a plain object from a GetCreditCardResponse message. Also converts values to other types if specified.
     * @function toObject
     * @memberof GetCreditCardResponse
     * @static
     * @param {GetCreditCardResponse} message GetCreditCardResponse
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    GetCreditCardResponse.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.arrays || options.defaults)
            object.cards = [];
        if (message.cards && message.cards.length) {
            object.cards = [];
            for (var j = 0; j < message.cards.length; ++j)
                object.cards[j] = $root.CreditCard.toObject(message.cards[j], options);
        }
        return object;
    };

    /**
     * Converts this GetCreditCardResponse to JSON.
     * @function toJSON
     * @memberof GetCreditCardResponse
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    GetCreditCardResponse.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return GetCreditCardResponse;
})();

module.exports = $root;
