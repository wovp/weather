import { Chart } from './charts';
/**
 * 折线图
 */
declare class DrawLine extends Chart {
    constructor();
    bindEvent(e: any, callback: any): void;
    clearGrid(index?: any): void;
    animate(): void;
    create(): void;
    initData(): void;
    drawTag(): void;
    drawAxis(): void;
    drawY(): void;
}
export default DrawLine;
