import { AxisInterface } from './chartInterface';
export declare function roundRect(ctx: any, x: any, y: any, width: any, height: any, radius: any): void;
export declare function calculateNum(arr: any, isMin?: any): {
    num: number;
    step: any;
    min: number;
    max: number;
};
/**
 * 图表基类
 */
export declare class Chart {
    ctx: any;
    W: number;
    H: number;
    cPaddingT: number;
    cPaddingB: number;
    cPaddingL: number;
    cPaddingR: number;
    color: Array<string>;
    legend: Array<any>;
    tooltip: any;
    series: Array<any>;
    xAxis: AxisInterface;
    yAxis: AxisInterface;
    animateArr: Array<any>;
    info: any;
    drawing: boolean;
    constructor();
    init(ctx: any, opt: any): void;
    setOption(opt: any): void;
    create(): void;
    setCtxStyle(style: any): void;
    showInfo(pos: any, title: any, arr: any): void;
}
