import * as $protobuf from "protobufjs";
/** Properties of a CreditCard. */
export interface ICreditCard {

    /** CreditCard id */
    id?: (string|null);

    /** CreditCard displayName */
    displayName?: (string|null);

    /** CreditCard promotions */
    promotions?: (IPromotion[]|null);
}

/** Represents a CreditCard. */
export class CreditCard implements ICreditCard {

    /**
     * Constructs a new CreditCard.
     * @param [properties] Properties to set
     */
    constructor(properties?: ICreditCard);

    /** CreditCard id. */
    public id: string;

    /** CreditCard displayName. */
    public displayName: string;

    /** CreditCard promotions. */
    public promotions: IPromotion[];

    /**
     * Creates a new CreditCard instance using the specified properties.
     * @param [properties] Properties to set
     * @returns CreditCard instance
     */
    public static create(properties?: ICreditCard): CreditCard;

    /**
     * Encodes the specified CreditCard message. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @param message CreditCard message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: ICreditCard, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified CreditCard message, length delimited. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @param message CreditCard message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: ICreditCard, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a CreditCard message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): CreditCard;

    /**
     * Decodes a CreditCard message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): CreditCard;

    /**
     * Verifies a CreditCard message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a CreditCard message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns CreditCard
     */
    public static fromObject(object: { [k: string]: any }): CreditCard;

    /**
     * Creates a plain object from a CreditCard message. Also converts values to other types if specified.
     * @param message CreditCard
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: CreditCard, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this CreditCard to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}

/** Properties of a Promotion. */
export interface IPromotion {

    /** Promotion id */
    id?: (string|null);

    /** Promotion displayName */
    displayName?: (string|null);

    /** Promotion startDate */
    startDate?: (string|null);

    /** Promotion endDate */
    endDate?: (string|null);

    /** Promotion type */
    type?: (string|null);

    /** Promotion repeatPattern */
    repeatPattern?: (string|null);

    /** Promotion rate */
    rate?: (number|null);

    /** Promotion category */
    category?: (IShoppingCategory|null);
}

/** Represents a Promotion. */
export class Promotion implements IPromotion {

    /**
     * Constructs a new Promotion.
     * @param [properties] Properties to set
     */
    constructor(properties?: IPromotion);

    /** Promotion id. */
    public id: string;

    /** Promotion displayName. */
    public displayName: string;

    /** Promotion startDate. */
    public startDate: string;

    /** Promotion endDate. */
    public endDate: string;

    /** Promotion type. */
    public type: string;

    /** Promotion repeatPattern. */
    public repeatPattern: string;

    /** Promotion rate. */
    public rate: number;

    /** Promotion category. */
    public category?: (IShoppingCategory|null);

    /**
     * Creates a new Promotion instance using the specified properties.
     * @param [properties] Properties to set
     * @returns Promotion instance
     */
    public static create(properties?: IPromotion): Promotion;

    /**
     * Encodes the specified Promotion message. Does not implicitly {@link Promotion.verify|verify} messages.
     * @param message Promotion message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: IPromotion, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified Promotion message, length delimited. Does not implicitly {@link Promotion.verify|verify} messages.
     * @param message Promotion message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: IPromotion, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a Promotion message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): Promotion;

    /**
     * Decodes a Promotion message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): Promotion;

    /**
     * Verifies a Promotion message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a Promotion message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns Promotion
     */
    public static fromObject(object: { [k: string]: any }): Promotion;

    /**
     * Creates a plain object from a Promotion message. Also converts values to other types if specified.
     * @param message Promotion
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: Promotion, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this Promotion to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}

/** Properties of a ShoppingCategory. */
export interface IShoppingCategory {

    /** ShoppingCategory id */
    id?: (string|null);

    /** ShoppingCategory displayName */
    displayName?: (string|null);
}

/** Represents a ShoppingCategory. */
export class ShoppingCategory implements IShoppingCategory {

    /**
     * Constructs a new ShoppingCategory.
     * @param [properties] Properties to set
     */
    constructor(properties?: IShoppingCategory);

    /** ShoppingCategory id. */
    public id: string;

    /** ShoppingCategory displayName. */
    public displayName: string;

    /**
     * Creates a new ShoppingCategory instance using the specified properties.
     * @param [properties] Properties to set
     * @returns ShoppingCategory instance
     */
    public static create(properties?: IShoppingCategory): ShoppingCategory;

    /**
     * Encodes the specified ShoppingCategory message. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @param message ShoppingCategory message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: IShoppingCategory, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified ShoppingCategory message, length delimited. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @param message ShoppingCategory message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: IShoppingCategory, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a ShoppingCategory message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): ShoppingCategory;

    /**
     * Decodes a ShoppingCategory message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): ShoppingCategory;

    /**
     * Verifies a ShoppingCategory message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a ShoppingCategory message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns ShoppingCategory
     */
    public static fromObject(object: { [k: string]: any }): ShoppingCategory;

    /**
     * Creates a plain object from a ShoppingCategory message. Also converts values to other types if specified.
     * @param message ShoppingCategory
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: ShoppingCategory, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this ShoppingCategory to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}
