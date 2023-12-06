import { InterfaceObj } from '../../utils/chartInterface';
@Component
export declare struct Tooltip {
    @Link
    tooltipInfo: InterfaceObj;
    @State
    x: number;
    @State
    y: number;
    onTooltipInfoUpdated(): void;
    getPos(rect: any): void;
    build(): void;
}
